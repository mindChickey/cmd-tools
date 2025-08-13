
alias make1='make -f ../Makefile -j16'

alias qdebug='/home/wang/Music/quick-debug/qdebug.js'
alias debugmindtrack='qdebug --dir ~/mt-dev/mindtrackRuntime `which mindtrack`'

close_mem_random(){
  setarch `uname -m` -R "$@"
}

