#!/bin/bash

. ./check.sh
. ./create.sh

check_input $@

if [[ error -eq 0 ]]; then
    create_dirs $@
else
    print_error
fi
