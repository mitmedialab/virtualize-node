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
    export PREFIX=$VIRTUALIZE_NODE_DIR/node
    make
    make install
    rm -rf $VIRTUALIZE_NODE_DIR/n
)
N_PREFIX=$VIRTUALIZE_NODE_DIR $VIRTUALIZE_NODE_DIR/node/bin/n $node_version

export PATH="$VIRTUALIZE_NODE_DIR/node/bin:$PATH"  # apparently npm can't find it's own node install?
$VIRTUALIZE_NODE_DIR/node/bin/npm install -g yarn

echo "node installed"

exit


## Notes:
## rename activate.bash -> activate?
## rename repo to virtualize-node?
## centralize versions
