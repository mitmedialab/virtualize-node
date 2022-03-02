#!/bin/bash

if [[ "${BASH_SOURCE-}" != "$0" ]]; then
    echo "You cannot source this script. Run it as ./$0" >&2
    exit 33
fi

VIRTUALIZE_NODE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE}" )" &> /dev/null && pwd )

#node_version=14.16
# Retrieve node version to be installed/activated
source "$VIRTUALIZE_NODE_DIR/version.bash"
node_version=$VERSION

git clone https://github.com/tj/n $VIRTUALIZE_NODE_DIR/n
(
    cd $VIRTUALIZE_NODE_DIR/n
    export PREFIX=$VIRTUALIZE_NODE_DIR
    make
    echo 1
    make install
    echo 2
    rm -rf $VIRTUALIZE_NODE_DIR/n
    echo 3
)
echo 4
N_PREFIX=$VIRTUALIZE_NODE_DIR $VIRTUALIZE_NODE_DIR/bin/n $node_version
echo 5

echo 6
$VIRTUALIZE_NODE_DIR/bin/npm install -g yarn

echo 7
echo "node installed"

exit
