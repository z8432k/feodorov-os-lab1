#!/usr/bin/env bash

# Переменная с номером варианта (константа):
TASKID=-1

# Дополнительные переменные (должны вычисляться динамически):
VAR_1=$(echo "-1")
VAR_2=$(echo "-1")

# place your code here
# поместите сюда свой код

out_file="results.txt"

TASKID=9


VAR_1=$(egrep -cx ".*" dns-tunneling.log)

awk -f lab1.awk -- dns-tunneling.log > $out_file

VAR_2=$(egrep -cE '"client ip": "10\.1\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}"' results.txt)
