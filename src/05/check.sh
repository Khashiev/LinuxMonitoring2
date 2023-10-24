#!/bin/bash

error=0

function check_input {
    if [[ $# -ne 1 ]]; then
        error=1
    elif ! [[ $1 =~ ^[1-4]{1}$ ]]; then
        error=2
    fi
}

function print_error {
    case "$error" in
    1) echo "You need to specify 1 parameters!" ;;
    2) echo "Incorrect input" ;;
    esac
}
