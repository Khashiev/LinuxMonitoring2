#!/bin/bash

files="../04/1.log ../04/2.log ../04/3.log ../04/4.log ../04/5.log"

function code_request {
    awk '{ print $0 }' $files | sort -k 7 >>code_request.txt
}

function all_uniq_ip {
    awk '{print $1}' $files | uniq | sort >>all_uniq_ip.txt
}

function code_error {
    awk '{ if ($7 >= 400) print $0 }' $files >>code_error.txt
}

function error_uniq_ip {
    awk '{ if ($7 >= 400) print $1 }' $files | uniq >>error_uniq_ip.txt
}
