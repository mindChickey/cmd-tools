# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT="%F %T "

vd(){
  builtin cd "${1:-$HOME}"
  ls
}

alias rm0='/bin/rm'
alias rmm='trash -rf'
alias rm="echo Warning: Use \'rm0\' for real delete or \'rmm\' for trash."

set -o vi

push-path(){
  echo -e "export PATH=\$PATH:$(pwd)" >> ~/.bashrc
  source ~/.bashrc
}

alias pss='ps aux | grep '
alias tss='ss -tulpn | grep '

alias ssh1='ssh -L 3111:localhost:3111  -L 27018:localhost:27017 server'
alias open-sshfs='sshfs mac.local:/Users/wang ~/mac.home'
alias open-mongod='mongod --dbpath /var/lib/mongo --logpath /var/log/mongodb/mongod.log --fork'

alias clang1='clang -O -S -emit-llvm -fno-inline -fno-exceptions'
alias clang++1='clang1 -O -S -emit-llvm -fno-inline -fno-exceptions'

clang-asm() {
  clang -nostdlib -e _start0 "$@" -lasmlib
}

alias oclip='xclip -selection clipboard -o'
