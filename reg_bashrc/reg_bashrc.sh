# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT="%F %T "

CD()
{
  cd $1
  ls
}
alias cd='CD'

alias rm0='/bin/rm'
alias rmm='trash -rf'
alias rm="echo Warning: Use \'rm0\' for real delete or \'rmm\' for trash."

set -o vi

push_path(){
  echo -e "export PATH=\$PATH:$(pwd)" >> ~/.bashrc
  source ~/.bashrc
}

alias pss='ps aux | grep '
alias tss='ss -tulpn | grep '

alias ssh1='ssh -L 3111:localhost:3111  -L 27018:localhost:27017 server'

alias clang1='clang -O -S -emit-llvm -fno-inline -fno-exceptions'
alias clang++1='clang1 -O -S -emit-llvm -fno-inline -fno-exceptions'
