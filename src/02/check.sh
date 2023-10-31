#!/bin/bash

error=0

function check_input {
    if [[ $# -ne 3 ]]; then
        error=1
    elif ! [[ $1 =~ ^[a-zA-Z]{1,7}$ ]]; then
        error=2
    elif ! [[ $2 =~ ^([a-zA-Z+]{1,7})\.([a-zA-Z]{1,3})$ ]]; then
        error=3
    elif [[ $(echo "$3" | awk -F"Mb" '{print $1}') -gt 100 ]]; then
        error=4
    fi
}

function print_error {
    case "$error" in
    1) echo "You need to specify 3 parameters!" ;;
    2) echo "Incorrect list of letters for dirs names" ;;
    3) echo "Incorrect list of letters for files names" ;;
    4) echo "Incorrect file size" ;;
    esac
}
