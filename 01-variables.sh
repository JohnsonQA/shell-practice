#!/bin/bash

#variables - Which holds the values of different data types and can be used anywhere in the code dynamically

#Ways of using Varibales
#Initilaize varibale at global level and use the variable keyword using $ sign followed by varibale name everywhere in the code
#Passing as an arguments during run time. Just by defining the values as $1 and $2 in the variables

PERSON1=$1 
PERSON2=$2 

echo "$PERSON1:: Hey $PERSON2, How you doing?"
echo "$PERSON2:: Hey $PERSON1!! I am doing great. How about you?"
echo "$PERSON1:: Doing great. When are you going to Mars?"
echo "$PERSON2:: May be end of the year. You wanna join in?"
echo "$PERSON1:: Yes ofcourse!! would love to visit Mars with you :)"

