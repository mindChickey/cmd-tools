
alias make1='make -f ../Makefile -j16'

alias qlldb='/home/wang/Music/quick-debug/qdebug.js --type lldb'
alias qdebugpy='/home/wang/Music/quick-debug/qdebug.js --type debugpy'

alias debugcmusee='qlldb --dir ~/cmusee-dev/cmuseeRuntime `which cmusee`'

close-mem-random(){
  setarch `uname -m` -R "$@"
}