#!/bin/bash

#Problem-statement - Read the lines in a file

while  read -r line   #It reads the line in 12-set.sh . IFS - Internal Field separator
do
    echo $line
done < 12-set.sh