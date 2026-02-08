#!/bin/bash

# 函数名称: cclip
# 作用: 执行传入的命令，将其标准输出同时输出到终端和 X11 的 CLIPBOARD 剪切板。
# 用法: cclip <你的命令> [命令参数...]
# 依赖: xclip 工具

cclip() {
    # 检查是否有输入参数
    if [ $# -eq 0 ]; then
        echo "错误: 请提供一个要执行的命令。" >&2
        echo "用法: cclip <你的命令> [命令参数...]" >&2
        return 1
    fi

    # 使用 'tee' 命令同时将输出导向两个地方:
    # 1. /dev/tty (当前终端的标准输出) - 确保终端上能显示输出
    # 2. xclip -selection clipboard (剪切板)
    
    # 核心逻辑：执行命令，通过管道将其输出给 tee，
    # tee 再通过进程替换导向到 xclip
    
    # 注意：我们不再使用 /dev/tty，因为 tee 默认就会输出到标准输出 (即终端)
    # 我们只需要将 tee 的输出重定向到 xclip 即可。

    "$@" 2>&1 | tee >(xclip -selection clipboard)

    # 检查命令执行是否成功，如果命令本身失败，不会显示任何成功信息
    if [ ${PIPESTATUS[0]} -ne 0 ]; then
        echo "警告: 命令执行失败，请检查命令和参数是否正确。" >&2
        return ${PIPESTATUS[0]}
    fi
}