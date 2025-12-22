#!/bin/bash

gitpush() {
    if [ $# -eq 0 ]; then
        git commit -a 
        return $?
    fi

    commit_message="$*"

    git commit -am "$commit_message"
    
    if [ $? -ne 0 ]; then
        return $?
    fi

    echo
    echo
    git push origin master
    
    return $?
}

gitlines() {
    for repo in "$@"; do
        if [ -d "$repo/.git" ]; then
	    lines=$( (cd "$repo" > /dev/null && git ls-files -z | xargs -0 wc -l) 2>/dev/null | tail -n 1 | awk '{print $1}' )
            count=${lines:-0}
            printf "%-25s : %s lines\n" "$repo" "$count"
        else
            echo "跳过: $repo (不是有效的 Git 仓库)"
        fi
    done
}
