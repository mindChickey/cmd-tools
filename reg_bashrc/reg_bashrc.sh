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

alias rm0=rm
alias rm=trash

set -o vi

push_path(){
  echo -e "export PATH=\$PATH:$(pwd)" >> ~/.bashrc
  source ~/.bashrc
}
