#!/bin/bash

if [[ $# -ne 0 ]]; then
    echo "Incorrect input"
else
    sudo apt install -y goaccess

    goaccess ../04/*.log --log-format=COMBINED -o report.html
fi
