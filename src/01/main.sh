#!/bin/bash

. ./check.sh

check_input $@

if [[ error -eq 0 ]]; then
    echo "correct"
else
    print_error
fi
