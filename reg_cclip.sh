#!/bin/bash

# 函数名称: cclip
# 作用: 执行传入的命令，将其标准输出同时输出到终端和 X11 的 CLIPBOARD 剪切板。
# 用法: cclip <你的命令> [命令参数...]
# 依赖: xclip 工具

cclip() {
  "$@" 2>&1 | tee >(perl -0777 -pe 's/\s+$//' | xclip -selection clipboard)
}