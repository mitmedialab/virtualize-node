### (Don't edit below, unless you are a maintener of this package)

#https://unix.stackexchange.com/a/153061
VIRTUALIZE_SOURCED_NAME="$_"

if [ "${BASH_SOURCE-}" = "$0" ]; then
    echo "You must source this script: \$ source $0" >&2
    exit 33
fi

if [[ ! -z $VIRTUALIZE_ROOT ]]; then
    echo "virtualizer is active, not activating"
    unset VIRTUALIZE_SOURCED_NAME
    return
fi

VIRTUALIZE_NODE_DIR=$( cd -- "$( dirname -- "${SOURCED_NAME}" )" &> /dev/null && pwd )

# Specify where node should be installed (default is 'node' folder -- probably keep it that way unless you have a good reason)
VIRTUALIZE_NODE_INSTALL_DIR="$VIRTUALIZE_NODE_DIR/node"
VIRTUALIZE_ROOT=$( dirname -- "${VIRTUALIZE_NODE_DIR}" )

# Retrieve node version to be installed/activated
source "$VIRTUALIZE_NODE_DIR/version.bash"

# 1. Make sure desired version is installed (install it, if not)
$VIRTUALIZE_NODE_DIR/install.sh $VIRTUALIZE_NODE_INSTALL_DIR $VERSION

# 2. Add local node binaries to system PATH variable
VIRTUALIZE_NODE_ORIG_PATH="$PATH"
export PATH="$LOCAL_NODE_INSTALL_DIR/bin":"$VIRTUALIZE_ROOT/node_modules/.bin":$PATH

unset VIRTUALIZED_ROOT

unactivate_node() {
    PATH="$VIRTUALIZE_NODE_ORIG_PATH"
    unset VIRTUALIZE_NODE_ORIG_PATH
    #unset N_PREFIX
    unset VIRTUALIZE_SOURCED_NAME
    unset VIRTUALIZE_NODE_DIR
}

# stop here if called on behalf of virtualize
if [[ ! -z $VIRTUALIZED_ACTIVATING ]]; then
    # let virtualized deal with customizing the prompt
    return
fi

function unactivate() {
    unactivate_node()
}

# 3. Display 'activated' node version in bash prompt
ACTIVE_NODE_VERSION=`node --version`
PREFIX="local node:"
# Avoid displaying multiple 'local node readouts'
# (FYI: The below uses bash's 'sed' [stream editor] functionality along with regex to subsitute & add information to the PS1, 'custom prompt' environment variable)
DISPLAY=$(echo $PS1 | sed 's/\(($PREFIX[^)]*\))//' | sed 's/^/($PREFIX $ACTIVE_NODE_VERSION)/')
PS1="$DISPLAY "
