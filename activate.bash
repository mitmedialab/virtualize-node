### (Don't edit below, unless you are a maintener of this package)

#https://unix.stackexchange.com/a/153061
VIRTUALIZE_SOURCED_NAME="$_"

if [ "${BASH_SOURCE-}" = "$0" ]; then
    echo "You must source this script: \$ source $0" >&2
    exit 33
fi

if [[ $VIRTUALIZE_ROOT && ! $VIRTUALIZE_ACTIVATING ]]; then
    echo "virtualizer is active, not activating" $VIRTUALIZE_SOURCED_NAME
    unset VIRTUALIZE_SOURCED_NAME
    return
fi

VIRTUALIZE_NODE_DIR=$( cd -- "$( dirname -- "${VIRTUALIZE_SOURCED_NAME}" )" &> /dev/null && pwd )
export N_PREFIX=$VIRTUALIZE_NODE_DIR

VIRTUALIZE_NODE_ORIG_PATH="$PATH"
export PATH="$VIRTUALIZE_NODE_DIR/bin:$VIRTUALIZE_ROOT/node_modules/.bin:$PATH"

function unactivate_node() {
    PATH="$VIRTUALIZE_NODE_ORIG_PATH"
    unset VIRTUALIZE_NODE_ORIG_PATH
    unset N_PREFIX
    unset VIRTUALIZE_SOURCED_NAME
    unset VIRTUALIZE_NODE_DIR
}

# stop here if called on behalf of virtualize
if [[ $VIRTUALIZE_ACTIVATING ]]; then
    # let virtualized deal with customizing the prompt
    return
fi

###
### standalone mode only from here on
###

function unactivate() {
    unactivate_node
    unset -f unactivate_node
    PS1="$VIRTUALIZE_NODE_ORIG_PS1"
    unset VIRTUALIZE_NODE_ORIG_PS1
    unset VIRTUALIZE_NODE_ACTIVE_VERSION
    unset VIRTUALIZE_NODE_PREFIX
    unset VIRTUALIZE_NODE_DISPLAY
    unset -f unactivate
    echo "unactivated $virtualize_root"
}

VIRTUALIZE_NODE_ORIG_PS1="$PS1"
VIRTUALIZE_NODE_ACTIVE_VERSION=`$VIRTUALIZE_NODE_DIR/bin/node --version`
VIRTUALIZE_NODE_DISPLAY="`echo $VIRTUALIZE_NODE_DIR | sed \"s%^$HOME/%%" | sed 's/\//·/g'` $VIRTUALIZE_NODE_ACTIVE_VERSION"
if [[ $ZSH_VERSION ]]; then
   PS1="[$VIRTUALIZE_NODE_DISPLAY]$PS1"
else  # for bash (and others?)
   PS1="[$VIRTUALIZE_NODE_DISPLAY]\n$PS1"
fi

echo "node activated for $VIRTUALIZE_NODE_DIR"
echo "type 'unactivate' to undo"
