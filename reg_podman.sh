
alias pod='podman images && echo -e "\n" && podman ps -a'

spodman() {
  podman exec -it "$2" /bin/bash
}

alias poddir="podman inspect -f '/proc/{{.State.Pid}}/root'"

alias doc='docker images && echo -e "\n" && docker ps -a'

sdocker() {
  docker exec -it "$2" /bin/bash
}

alias docdir="docker inspect -f '/proc/{{.State.Pid}}/root'"