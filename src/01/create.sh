#!/bin/bash

path=$1
number_of_dirs=$2
names_of_dirs=$3

function create_dirs {
    dir_name=""
    counter=1

    for ((i = 0; i < number_of_dirs; i++)); do
        for ((j = 0; j <= ${#names_of_dirs}; j++)); do
            last_char="${dir_name: -1}"
            current_char="${names_of_dirs:j:1}"

            if [[ $last_char != $current_char ]]; then
                for ((k = 0; k < counter; k++)); do
                    dir_name+=$current_char
                done
            fi
        done

        dir_name+="_"
        dir_name+=$(date +"%d%m%y")

        mkdir $path/$dir_name

        # echo "Dir created: $(pwd $path)/$dir_name/ - $(date +"%d-%m-%Y") - $(du -h $path/$dir_name/ | awk '{print $1}')" >>log_file.log
        dir_name=""
        ((counter++))
    done
}
