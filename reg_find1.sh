#!/bin/bash

function find1() {
    # 检查是否有模式参数
    if [ $# -lt 1 ]; then
        echo "使用方法: find1 <模式> [搜索路径]"
        echo "模式中的逗号 (,) 将自动替换为星号 (*)。"
        echo "例如: find1 ,.py"
        return 1
    fi

    local user_pattern="$1"
    local actual_pattern="${user_pattern//,/\*}"
    local search_path="."
    
    if [ $# -ge 2 ]; then
        # $2 是路径
        search_path="$2"
    fi

    find "$search_path" -name "$actual_pattern"
}