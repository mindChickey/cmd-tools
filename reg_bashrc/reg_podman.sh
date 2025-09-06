
alias pod='podman images && echo -e "\n" && podman ps -a'

podman1() {
  podman exec -it "$1" /bin/bash
}

podvim() {
  rm /tmp/podman-file
  podman cp "$1":"$2" /tmp/podman-file
  vim /tmp/podman-file
  podman cp /tmp/podman-file "$1":"$2"
  md5sum /tmp/podman-file
  podman exec "$1" md5sum "$2"
}