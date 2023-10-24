#!/bin/bash

chmod +x check.sh
chmod +x sort.sh

. ./check.sh
. ./sort.sh

check_input $@

function select_sort {
    case $1 in
    1) code_request ;;
    2) all_uniq_ip ;;
    3) code_error ;;
    4) error_uniq_ip ;;
    esac
}

if [[ error -eq 0 ]]; then
    select_sort $1
else
    print_error
fi
