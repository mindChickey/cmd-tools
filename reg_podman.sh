
alias pod='podman images && echo -e "\n" && podman ps -a'

spodman() {
  podman exec -it "$2" /bin/bash
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

alias doc='docker images && echo -e "\n" && docker ps -a'

sdocker() {
  docker exec -it "$2" /bin/bash
}
