
CURRENT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)

source "$CURRENT_DIR"/reg_bashrc.sh
source "$CURRENT_DIR"/reg_debug.sh
source "$CURRENT_DIR"/reg_podman.sh
source "$CURRENT_DIR"/reg_savecmd.sh
source "$CURRENT_DIR"/reg_wcmd.sh
source "$CURRENT_DIR"/reg_cclip.sh
source "$CURRENT_DIR"/reg_fcopy.sh
source "$CURRENT_DIR"/reg_gitpush.sh
source "$CURRENT_DIR"/reg_find1.sh