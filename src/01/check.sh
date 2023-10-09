#!/bin/bash

error=0

function check_input {
    if [[ $# -ne 6 ]]; then
        error=1
    elif ! [[ -d $1 ]]; then
        error=2
    elif ! [[ $2 =~ ^[0-9]+$ ]]; then
        error=3
    elif ! [[ $3 =~ ^[a-zA-Z]{1,7}$ ]]; then
        error=4
    elif ! [[ $4 =~ ^[0-9]+$ ]]; then
        error=5
    elif ! [[ $5 =~ ^([a-zA-Z+]{1,7})\.([a-zA-Z]{1,3})$ ]]; then
        error=6
    elif [[ $6 -ge 100 ]]; then
        error=7
    fi
}

function print_error {
    case "$error" in
    1) echo "You need to specify 6 parameters!" ;;
    2) echo "Incorrect path!" ;;
    3) echo "Incorrect number of dirs" ;;
    4) echo "Incorrect list of letters for dirs names" ;;
    5) echo "Incorrect number of files" ;;
    6) echo "Incorrect list of letters for files names" ;;
    7) echo "Incorrect file size" ;;
    esac
}
