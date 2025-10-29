#!/bin/bash

wcmd() {
    if [ $# -eq 0 ]; then
        echo "Usage: wcmd <command_name> <arg1> [arg2]..." >&2
        return 1
    fi

    local command_name="$1"
    local full_command="$@"
    
    # 2. 计算 MD5 哈希并取前 6 位
    local full_hash=""
    if command -v md5sum &> /dev/null; then
        # Linux/Common UNIX: 使用 cut -c 1-6 截取前6位
        full_hash=$(echo -n "$full_command" | md5sum | awk '{print $1}')
    elif command -v md5 &> /dev/null; then
        # macOS/BSD: 使用 md5 -q
        full_hash=$(echo -n "$full_command" | md5 -q)
    else
        echo "Error: Neither 'md5sum' nor 'md5' found. Cannot compute hash." >&2
        return 1
    fi

    # 提取哈希值的前 6 位
    local command_hash_short="${full_hash:0:6}"

    local filename="wcmd.${command_name}.${command_hash_short}.sh"

    # 使用 cat > EOF 结构来写入多行内容，包括 Shebang 和命令
    cat > "$filename" << EOF
#!/bin/bash

$full_command
EOF
    
    # 5. 权限加可执行
    chmod +x "$filename"

    echo "written to $filename"
}