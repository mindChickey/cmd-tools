
alias pod='podman images && echo -e "\n" && podman ps -a'

podman1() {
  podman exec -it "$1" /bin/bash
}

podvim() {
  local TMP_FILE=~/.podvim_temp
  trash $TMP_FILE
  podman cp "$1":"$2" $TMP_FILE
  vim $TMP_FILE
  podman cp $TMP_FILE "$1":"$2"
  md5sum $TMP_FILE
  podman exec "$1" md5sum "$2"
}