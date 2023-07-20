#!/bin/bash

DEFAULT_NODE_VERSION="16.13.2"

if [[ ! $BASH_SOURCE ]]; then
    echo "You cannot source this script. Run it as ./$0" >&2
    exit 33
fi

VIRTUALIZE_NODE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE}" )" &> /dev/null && pwd )

if [[ $1 ]]; then
    VIRTUALIZE_NODE_VERSION=$1
elif [[ ! $VIRTUALIZE_NODE_VERSION ]]; then
    VIRTUALIZE_NODE_VERSION=$DEFAULT_NODE_VERSION
fi

if [[ ! -d $VIRTUALIZE_NODE_DIR/n ]]; then
   git clone https://github.com/tj/n $VIRTUALIZE_NODE_DIR/n
   (
       cd $VIRTUALIZE_NODE_DIR/n
       export PREFIX=$VIRTUALIZE_NODE_DIR/node
       make
       make install
       rm -rf $VIRTUALIZE_NODE_DIR/n
   )
fi

N_PREFIX=$VIRTUALIZE_NODE_DIR/node $VIRTUALIZE_NODE_DIR/node/bin/n $VIRTUALIZE_NODE_VERSION
export PATH="$VIRTUALIZE_NODE_DIR/node/bin:$PATH"  # apparently npm can't find it's own node install?
$VIRTUALIZE_NODE_DIR/node/bin/npm install -g yarn

echo "node installed"

exit
