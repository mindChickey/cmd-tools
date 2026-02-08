
savecmd() {
  if [ -z "$1" ]; then
    local n=1
  else
    local n=$1
  fi
  
  local log_file="/home/wang/Music/cmd-tools/savecmd.log"
  
  local cmds=$(history $((n+1)) | head -n -1)
  
  echo "$cmds" >> "$log_file"

  echo "save these commands to $log_file"
  echo "$cmds"
}