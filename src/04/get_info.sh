#!/bin/bash

function get_random {
    echo $((RANDOM % $2 + $1))
}

function get_ip {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

function get_status {
    statuses=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
    idx=$((RANDOM % 10))
    echo "${statuses[$idx]}"
}

# status code:
# 200 - OK
# 201 - Created
# 400 - Bad Request
# 401 - Unauthorized
# 403 - Forbidden
# 404 - Not Found
# 500 - Internal Server Error
# 501 - Not Implemented
# 502 - Bad Gateway
# 503 - Service Unavailable

function get_method {
    methods=("GET" "POST" "PUT" "PATCH" "DELETE")
    idx=$((RANDOM % 5))
    echo "${methods[$idx]}"
}

function get_url {
    count=$((2 + RANDOM % 4))
    url=

    for ((i = 0; i < count; i++)); do
        url+="$(head -c 100 /dev/urandom | base64 | sed 's/[+=/A-Z]//g' | tail -c $(get_random 5 10))"
        if [[ i -eq 0 ]]; then
            url+=".com"
        fi

        if [[ i -ne $(($count - 1)) ]]; then
            url+="/"
        fi
    done

    echo "https://$url"
}

function get_agent {
    agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
    idx=$((RANDOM % 8))
    echo "${agents[$idx]}"
}

function get_date {
    output=0
    while [[ $output -eq 0 ]]; do
        day=$(get_random 1 31)
        month=$(get_random 1 12)
        year=$(get_random 0 24)
        output=$(check_days_in_month "$day $month $year")
    done
    local name_month=("" "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
    echo "$(printf "%02d" "$day")/${name_month[$month]}/$((2000 + $year))"
}

function get_time {
    hour=$(get_random 0 24)
    min=$(get_random 0 60)
    sec=$(get_random 0 60)
    echo "$(printf "%02d" "$hour"):$(printf "%02d" "$min"):$(printf "%02d" "$sec")"
}
