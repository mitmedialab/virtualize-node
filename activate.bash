### (Don't edit below, unless you are a maintener of this package)

#https://unix.stackexchange.com/a/153061
SOURCED_NAME="$_"

if [ "${BASH_SOURCE-}" = "$0" ]; then
    echo "You must source this script: \$ source $0" >&2
    exit 33
fi

if [[ ! -z $VIRTUALIZE_ROOT ]]; then
    echo "virtualizer is active, not activating"
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${SOURCED_NAME}" )" &> /dev/null && pwd )

# Specify where node should be installed (default is 'node' folder -- probably keep it that way unless you have a good reason)
LOCAL_NODE_INSTALL_DIRECTORY="$SCRIPT_DIR/node"
LOCAL_PROJECT_DIRECTORY=$( dirname -- "${SCRIPT_DIR}" )

# Retrieve node version to be installed/activated
VERSION_FILE="$SCRIPT_DIR/version.bash";
source $VERSION_FILE

# 1. Make sure desired version is installed (install it, if not)
$SCRIPT_DIR/install.sh $LOCAL_NODE_INSTALL_DIRECTORY $VERSION

# 2. Add local node binaries to system PATH variable
export PATH="$LOCAL_NODE_INSTALL_DIRECTORY/bin":"$LOCAL_PROJECT_DIRECTORY/node_modules/.bin":$PATH

if [[ ! -z $VIRTUALIZED_ACTIVATING ]]; then
    # let virtualized deal with customizing the prompt
    return
fi

# 3. Display 'activated' node version in bash prompt
ACTIVE_NODE_VERSION=`node --version`
PREFIX="local node:"
# Avoid displaying multiple 'local node readouts'
# (FYI: The below uses bash's 'sed' [stream editor] functionality along with regex to subsitute & add information to the PS1, 'custom prompt' environment variable)
DISPLAY=$(echo $PS1 | sed 's/\(($PREFIX[^)]*\))//' | sed 's/^/($PREFIX $ACTIVE_NODE_VERSION)/')
PS1="$DISPLAY "
