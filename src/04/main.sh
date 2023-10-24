#!/bin/bash

. ./check.sh

check_input $@

if [[ error -eq 0 ]]; then
    chmod +x get_info.sh
    . ./get_info.sh

    for ((i = 1; i < 6; i++)); do
        amount=$(get_random 100 901)
        file_date=$(get_date)
        for ((j = 0; j < amount; j++)); do
            ip=$(get_ip)
            status=$(get_status)
            method=$(get_method)
            file_time=$(get_time)
            url=$(get_url)
            agent=$(get_agent)
            echo "$ip - - [${file_date}:${file_time} +0400] \"$method ${url}\" $status - \"-\" \"${agent}\"" >>"${i}_tmp.log"
        done
    done
    for ((i = 1; i < 6; i++)); do
        sort -k 4 "${i}_tmp.log" >"$i.log"
        rm "${i}_tmp.log"
    done
else
    print_error
fi
