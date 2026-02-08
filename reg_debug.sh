
alias make1='make -f ../Makefile -j16'

alias qlldb='/home/wang/Music/quick-debug/qdebug.js --type lldb'
alias qdebugpy='/home/wang/Music/quick-debug/qdebug.js --type debugpy'

alias debugmindtrack='qlldb --dir ~/mt-dev/mindtrackRuntime `which mindtrack`'

close_mem_random(){
  setarch `uname -m` -R "$@"
}

