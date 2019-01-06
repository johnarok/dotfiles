# Declare all Global Environmental variables here
# Other Scripts can be sourced but should not contain global are path settings

# Standard Paths
export WS=$HOME/Projects
export IS=$HOME/progx
export PATH=$PATH:$IS/bin

# Docker
export DEFAULT_DOCKERFILES_DIR=$WS/dockerfiles
export DEFAULT_DOCKERTEMPLATES_DIR=$IS/dotfiles/docker-templates
export DEFAULT_DTR_ORG=NIL
export DEFAULT_DTR=NIL

# Github/Gitlab
export DEFAULT_GITSERVER=NIL

# GoLang
export GO3P=$WS/go/go3p
export GOWORK=$WS/go/gowork
#
export GOROOT=$IS/go
export GOUTIL=$IS/goutil
#
export GOPATH=$GO3P:$GOWORK:$GOUTIL
export GOBINS=$GOROOT/bin:$GOUTIL/bin
#
export PATH=$PATH:$GOBINS
#
export GOGHG=$GOWORK/src/github.com
export GOGHO=$GOWORK/src/$DEFAULT_GITSERVER 

# Python
export PYTHONUSERBASE=~/progx/python-tools
export PATH=$PATH:$PYTHONUSERBASE/bin

# Validate and Display Helpful messages

function validate_variables ()
{
if [ "$DEFAULT_GITSERVER" = "NIL" ]; then
    echo "Warning! DEFAULT_GITSERVER is not set"
fi

if [ "$DEFAULT_DTR_ORG" = "NIL" ]; then
    echo "Warning! DEFAULT_DTR_ORG is not set"
fi

if [ "$DEFAULT_DTR" = "NIL" ]; then
    echo "Warning! DEFAULT_DTR is not set"
fi
}
validate_variables

# Standard Utility Functions

function cdws ()		
{
 cd $WS
}

function cdis ()
{
 cd $IS
}

# Get Parent Directory Name
function gpdn()
{
 echo "$(dirname "$(pwd)" | awk -F'\/' '{print $NF'})"
}

# Get Base Directory Name
function gbdn()
{
 echo "$(pwd)" | awk -F'\/' '{print $NF}'
}

# Source the rest of environments
# Note you cannot have exports inside these files.

WORKDIR=$IS/dotfiles/profile-scripts
source $WORKDIR/functions.sh
source $WORKDIR/go.sh

# Prompts

source $WORKDIR/powerline.sh


