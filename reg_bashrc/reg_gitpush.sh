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

    git push origin master
    
    return $?
}