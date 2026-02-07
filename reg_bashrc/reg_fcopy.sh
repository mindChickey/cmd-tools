#!/bin/bash

fcopy() {
  if [ -z "$1" ]; then
    echo "用法: fcopy <文件1> [文件2] [文件3] ..."
    exit 1
  fi
  
  URI_LIST=""
  
  for file_path in "$@"; do
    ABSOLUTE_PATH=$(readlink -f "$file_path")
    FILE_URI="file://$ABSOLUTE_PATH"
    URI_LIST+="$FILE_URI"$'\n'
  done
  
  echo -n "$URI_LIST" | xclip -selection clipboard -t text/uri-list
  
  echo "文件URI已复制到剪贴板:"
  echo "$URI_LIST"
}