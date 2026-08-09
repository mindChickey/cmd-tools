#!/bin/bash

fcopy() {
  if [ -z "$1" ]; then
    echo "用法: fcopy <文件1> [文件2] [文件3] ..."
    exit 1
  fi
  
  URI_LIST=""
  
  for file_path in "$@"; do
    if [ ! -e "$file_path" ]; then
      echo "错误: 路径不存在 -> $file_path" >&2
      continue
    fi

    ABSOLUTE_PATH=$(readlink -f "$file_path")
    FILE_URI="file://$ABSOLUTE_PATH"
    URI_LIST+="$FILE_URI"$'\n'
  done
  
  if [ -z "$URI_LIST" ]; then
    echo "没有有效的路径被复制。" >&2
    return 1
  fi

  echo -n "$URI_LIST" | xclip -selection clipboard -t text/uri-list
  
  echo "文件URI已复制到剪贴板:"
  echo "$URI_LIST"
}