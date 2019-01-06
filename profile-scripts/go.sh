function cdghg() 
{
  cd $GOGHG
}

function cdgho()
{
  cd $GOGHO
}

function gostaticbuild ()
{
 CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo
}

function gorunme ()
{
 local PROJECT="$(gbdn)"
 local ORG="$(gpdn)"
 local WORKDIR="./docker/"
 $DEFAULT_RUN_DIR/$ORG/$PROJECT/runme.sh
}

function godockerbuild ()
{
 local VERSION=$1
 local PROJECT="$(gbdn)"
 local WORKDIR="./docker"
 if [ ! -e ./docker ]; then
    echo "Warning! $DEFAULT_DOCKERFILES_DIR/$STDPATH for deploy location"
    local WORKDIR=$DEFAULT_DOCKERFILES_DIR/$STDPATH
 fi
 local TEMPLATE=$DEFAULT_DOCKERTEMPLATES_DIR/Dockerfile-goalpine
 echo "Using $TEMPLATE as template"

 echo "Building statically"
 gostaticbuild

 echo "Staging Docker Build Directory"
 __stagedockerbuilddir $TEMPLATE $WORKDIR

 echo "Preparing runbuild.sh"
 PVERSION=$(docker images | grep $PROJECT | grep $DEFAULT_DTR | grep -v latest | grep -v none | awk '{print $2}')
 if [ "$PVERSION" == "" ]; then
  echo "No Previous Image cached locally, default version of $(getnextversion $PVERSION $VERSION) will be set"
 else
  echo "Bumping version to $(getnextversion $PVERSION $VERSION)"
 fi
 __generaterunbuild $PROJECT $WORKDIR $DEFAULT_DTR_ORG $DEFAULT_DTR $(getnextversion $PVERSION $VERSION)  "$WORKDIR/runbuild.sh"
}

# This has to be called from godockerbuild
function __generaterunbuild ()
{
 if [ "$#" -ne 6 ]; then
  echo "Usage: generaterunbuild PROJECT DOCKERFILEDIR ORG DTR VERSION SCRIPT got $@"
  return 
 fi
 local PROJECT=$1
 local DOCKERFILEDIR=$2
 local ORG=$3
 local DTR=$4
 local VERSION=$5
 local SCRIPT=$6
 
 echo "docker images | grep $PROJECT" > $SCRIPT
 echo "docker build $DOCKERFILEDIR -t ${ORG}/${PROJECT}:${VERSION}" >> $SCRIPT
 echo "docker tag ${ORG}/${PROJECT}:${VERSION} ${DTR}/${ORG}/${PROJECT}:${VERSION}" >> $SCRIPT
 echo "docker push ${DTR}/${ORG}/${PROJECT}:${VERSION}" >> $SCRIPT
 echo "docker images | grep $PROJECT" >> $SCRIPT
 chmod 750 $SCRIPT
 echo "Ensure DTR has a REPO setup already"
 echo "sudo $SCRIPT"
}

# This has to be called from godockerbuild
function __stagedockerbuilddir ()
{
  if [ "$#" -ne 2 ]; then
  echo "Usage: stagedockerbuildir TEMPLATE WORKDIR"
  return 
 fi

 local TEMPLATE=$1
 local WORKDIR=$2
 local PROJECT="$(gbdn)"
 local STDPATH="$(gpdn)/$PROJECT"
 local RUNME="$WS/runme/$STDPATH/runme.sh"
 
 echo "Copying Executable"
 mkdir -p $WORKDIR/deploy
 cp $PROJECT $WORKDIR/deploy/runapp
 
 echo "Copying Assets from $RUNME file"
 local ASSETS_LIST=$(cat $RUNME | grep ASSETS_LIST | awk -F'=' '{print $2}')
 for a in $ASSETS_LIST
 do
   echo ".. $a"
   cp -R $a $WORKDIR/deploy
 done

 echo "Preparing Entrypoint file"
 echo "#!/bin/sh" > $WORKDIR/entrypoint.sh
 cat $RUNME | grep export | awk -F'=' '{print "#" $1}' >> $WORKDIR/entrypoint.sh
 echo "./runapp" >> $WORKDIR/entrypoint.sh
 chmod 750 $WORKDIR/entrypoint.sh
 cat $WORKDIR/entrypoint.sh
 
 echo "Preparing Dockerfile from Template"
 EXPOSEPORT=`cat $RUNME | grep export | grep BIND_PORT | awk -F'=' '{print $2}'`
 cat $TEMPLATE > $WORKDIR/Dockerfile
 if [ "$EXPOSEPORT" = "" ]; then
   sed -i s/9999/8080/ $WORKDIR/Dockerfile
 else
   sed -i s/9999/$EXPOSEPORT/ $WORKDIR/Dockerfile
 fi 
 cat $WORKDIR/Dockerfile
}

