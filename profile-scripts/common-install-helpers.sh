#!/bin/bash
set -euxo

# local functions
function __install_url2bin ()
{
    local cmd=$1
    local url=$2
    echo "Installing $cmd from $url ..."
    curl -Lo $cmd $url
    chmod u+x $cmd
    mv $cmd ~/progx/bin
}

function __install_url2bintargz ()
{
    local cmd=$1
    local url=$2
    local tpath=/tmp/$$/$cmd
    mkdir -p $tpath
    echo "Installing $cmd from $url ..."
    curl -L $url | tar xz -C $tpath --strip-components 1
    mv $tpath/$cmd ~/progx/bin
    rm -rf $tpath
}

function __install_go2bin () 
{
    local cmd=$1
    local url=$2
    local GOPATH=/tmp/$$/$cmd
    mkdir -p $GOPATH
    echo "Building $cmd from $url ..."
    go get -u $url
    mv $GOPATH/bin/$cmd ~/progx/bin/
    rm -rf $GOPATH
}

function __install_repo2path () 
{
    local url=$1
    local destination=$2
    rm -rf $destination
    echo "Cloning to $destination from $url ..."
    git clone --depth 1 $url $destination
}


