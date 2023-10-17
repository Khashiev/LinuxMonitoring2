#!/bin/bash

. ./check.sh

check_input $@

if [[ error -eq 0 ]]; then
    chmod +x create_files.sh
    ./create_files.sh $@
else
    print_error
fi
