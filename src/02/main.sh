#!/bin/bash

. ./check.sh

check_input $@

if [[ error -eq 0 ]]; then
    chmod +x create_files.sh
    chmod +x clog.sh
    ./clog.sh $@
else
    print_error
fi
