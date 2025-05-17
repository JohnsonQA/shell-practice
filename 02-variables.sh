#!/bin/bash

#Hide the value using variables for more authnetication in scenarios like Otp's or PIN

echo "Enter the PIN:: "
read -s PIN  # PIN is varibale -s means hide the entering
echo "Entered PIN is: $PIN"
