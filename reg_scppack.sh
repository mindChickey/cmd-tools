#!/bin/bash

# 用法: scppack server:/remote/path file1 [file2 ...]
#   把 file1 file2 ... 打包成 tar.gz
#   scp 到 server 的 /remote/path 目录
#   在远端解压，然后删除压缩包
#
# 说明:
#   - 打包时用 basename 入包，远端解压后文件直接落在目标目录下
#   - 目标路径建议用绝对路径；尽量避免路径中含空格

# 用单引号包裹参数，供远端 shell 使用（内部单引号会被转义）
_sq() {
    printf "'%s'" "$(printf '%s' "$1" | sed "s/'/'\\\\''/g")"
}

scppack() {
    if [ $# -lt 2 ]; then
        echo "usage: scppack server:/path file1 [file2 ...]" >&2
        return 1
    fi

    local dest=$1
    shift
    local server=${dest%%:*}
    local rpath=${dest#*:}

    if [ "$server" = "$dest" ] || [ -z "$rpath" ]; then
        echo "scppack: destination must be like server:/path" >&2
        return 1
    fi

    local f
    for f in "$@"; do
        if [ ! -e "$f" ]; then
            echo "scppack: no such file or directory: $f" >&2
            return 1
        fi
    done

    # 生成临时压缩包
    local base="scppack_$$_$(date +%s).tar.gz"
    local tmpdir
    tmpdir=$(mktemp -d) || { echo "scppack: mktemp failed" >&2; return 1; }
    local tarpath="$tmpdir/$base"

    # 对每个输入用 -C <所在目录> <文件名> 打包，避免 tar 内出现绝对路径
    local targs=()
    for f in "$@"; do
        targs+=( -C "$(dirname -- "$f")" "$(basename -- "$f")" )
    done

    if ! tar czvf "$tarpath" "${targs[@]}"; then
        echo "scppack: tar failed" >&2
        rm -rf "$tmpdir"
        return 1
    fi

    # 确保远端目录存在
    if ! ssh "$server" "mkdir -p $(_sq "$rpath")"; then
        echo "scppack: failed to create remote directory: $rpath" >&2
        rm -rf "$tmpdir"
        return 1
    fi

    # 传输
    if ! scp "$tarpath" "$server:$rpath/$base"; then
        echo "scppack: scp failed" >&2
        rm -rf "$tmpdir"
        return 1
    fi

    # 远端解压并删除压缩包（解压失败则保留，便于排查）
    ssh "$server" "cd $(_sq "$rpath") && tar xzf $(_sq "$base") && rm -f $(_sq "$base")"
    local rc=$?

    # 清理本地临时文件
    rm -rf "$tmpdir"
    return $rc
}