#!/bin/bash

path=$1
length=$((${#path} - 1))
if [[ ${path:$length} != "/" ]]; then
    path="$path/"
fi

num_dirs=$2
name_dir=$3

letters_dir=($(echo $name_dir | fold -w1 | uniq))
length_letters_dir=${#letters_dir[@]}

array_dir=()
for ((i = 0; i < length_letters_dir; i++)); do
    array_dir[$i]=1
done

num_files=$4

IFS='.' read -ra name <<<"$5"
name_file=${name[0]}
file_extension=${name[1]}

letters_file=($(echo $name_file | fold -w1 | uniq))
length_letters_file=${#letters_file[@]}

array_file=()
for ((i = 0; i < length_letters_file; i++)); do
    array_file[$i]=1
done

size=$6
length=${#size}
file_size=${size:0:length-2}
bytes=${size:length-2}

size_disk=$(sudo df -BG / | grep / | awk '{ print $4 }' | sed s/"G"//g)

function random {
    echo $(($RANDOM % 100 + 1))
}

function sum_array {
    local arr=($@)
    len=${#arr[@]}
    sum=0
    for ((i = 0; i < len; i++)); do
        sum=$(($sum + ${arr[$i]}))
    done
    echo $sum
}

function iter_array {
    arr=($@)
    count=${#arr[@]}
    iter=1
    for ((i = 0; i < count; i++)); do
        if [[ $(($(sum_array ${arr[@]}) + $iter)) -gt 244 ]]; then
            arr[$i]=1
            continue
        else
            arr[$i]=$((${arr[$i]} + $iter))
            iter=0
        fi
    done
    echo "${arr[@]}"
}

function create_name_file {
    arr=($@)
    count=${#arr[@]}
    for ((i = 0; i < count; i++)); do
        string=$(printf "%${arr[$i]}c" "${letters_file[$i]}" | sed s/" "/${letters_file[$i]}/g)
        result+=$string
    done
    echo "$result"
}

function create_name_dir {
    arr=($@)
    count=${#arr[@]}
    for ((i = 0; i < count; i++)); do
        string=$(printf "%${arr[$i]}c" "${letters_dir[$i]}" | sed s/" "/${letters_dir[$i]}/g)
        result+=$string
    done
    echo "$result"
}

current_date=$(date +%d%m%y)

function create_files {
    input_path=$1
    count=$(random)
    while [[ count -gt 0 ]] && [[ $size_disk -gt 1 ]]; do
        if [[ -f "${input_path}${name_file}_${current_date}.${file_extension}" ]] || [[ $(sum_array ${array_file[@]}) -lt 4 ]]; then
            array_file=($(iter_array ${array_file[@]}))
            name_file=$(create_name_file ${array_file[@]})
            continue
        else
            sudo dd if=/dev/zero of="${input_path}${name_file}_${current_date}.${file_extension}" bs="${file_size}MB" count=1 status=none
            echo -e "${input_path}${name_file}_${current_date}.${file_extension}\t$(date +%d.%m.%Y)\t${file_size}Mb" >>../01/log.txt
            array_file=($(iter_array ${array_file[@]}))
            name_file=$(create_name_file ${array_file[@]})
            count=$(($count - 1))
            size_disk=$(sudo df -BG / | grep / | awk '{ print $4 }' | sed s/"G"//g)
        fi
    done
}

while [[ num_dirs -gt 0 ]] && [[ $size_disk -gt 1 ]]; do
    if [[ -d "${path}${name_dir}_${current_date}" ]] || [[ $(sum_array ${array_dir[@]}) -lt 4 ]]; then
        array_dir=($(iter_array ${array_dir[@]}))
        name_dir=$(create_name_dir ${array_dir[@]})
        continue
    else
        sudo mkdir "${path}${name_dir}_${current_date}"
        echo -e "${path}${name_dir}_${current_date}\t$(date +%d.%m.%Y)" >>../01/log.txt
        create_files "${path}${name_dir}_${current_date}/"
        array_dir=($(iter_array ${array_dir[@]}))
        name_dir=$(create_name_dir ${array_dir[@]})
        num_dirs=$(($num_dirs - 1))
        size_disk=$(sudo df -BG / | grep / | awk '{ print $4 }' | sed s/"G"//g)
    fi
done
