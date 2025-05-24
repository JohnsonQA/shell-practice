#!/bin/bash

#Problem-statement - Read the lines in a file

while IFS= read -r line
do
    echo $line
done < 12-set.sh