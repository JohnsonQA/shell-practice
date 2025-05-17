#!/bin/bash

#Arrays - It holds multiple values in a single varibale and its fixed in size

movies=("court" "HIT3" "Dragon" "Thandel")

echo "First movie in the list: ${movies[0]}"  #We can define variables in this way as well ${varibalename}
echo "The size of the movies list is: ${#movies[@]}"
echo "All the movies in the list are: ${movies[@]}"