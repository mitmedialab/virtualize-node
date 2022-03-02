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

echo 1
git clone https://github.com/tj/n $VIRTUALIZE_NODE_DIR/n
(
echo 2
    cd $VIRTUALIZE_NODE_DIR/n
echo 3
    export PREFIX=$VIRTUALIZE_NODE_DIR
echo 4
    make
echo 5
    make install
echo 6
)
echo 7
#rm -rf $VIRTUALIZE_NODE_DIR/n
echo 8
N_PREFIX=$VIRTUALIZE_NODE_DIR $VIRTUALIZE_NODE_DIR/bin/n $node_version
echo 9

$VIRTUALIZE_NODE_DIR/bin/npm install -g yarn
echo 10

echo "node installed"
echo 11

exit
