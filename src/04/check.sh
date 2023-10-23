#!/bin/bash

error=0

function check_input {
    if [[ $# -ne 0 ]]; then
        error=1
    fi
}

function print_error {
    case "$error" in
    1) echo "Incorrect input" ;;
    esac
}

days_in_month=("0" "31" "28" "31" "30" "31" "30" "31" "31" "30" "31" "30" "31")

function check_days_in_month {
    input_date=($1)
    if [[ $(expr ${input_date[2]} % 4) -eq 0 ]] && [[ ${input_date[1]} -eq 2 ]]; then
        max_days=$((${days_in_month[2]} + 1))
    else
        max_days="${days_in_month[${input_date[1]}]}"
    fi
    if [[ ${input_date[0]} -le $max_days ]]; then
        echo "1"
    else
        echo "0"
    fi
}
