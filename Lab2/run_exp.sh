#!/bin/bash

input_file="DFG1.txt"

for adders in 1 2
do
    for multipliers in 1 2
    do
        echo "Running with $adders adders, $multipliers multipliers, 1 addTime, 2 mulTime"
        ./scheduler $input_file $adders $multipliers 1 2 > "logs/${input_file:0:4}_${adders}_${multipliers}.log"
    done
done

input_file="DFG2.txt"
for adders in 1 2 3
do
    for multipliers in 1 2 3
    do
        echo "Running with $adders adders, $multipliers multipliers, 1 addTime, 1 mulTime"
        ./scheduler $input_file $adders $multipliers 1 1 > "logs/${input_file:0:4}_${adders}_${multipliers}.log"
    done
done


input_file="RGB.txt"
for adders in 1 2 3
do 
    for multipliers in 1 2 3
    do
        echo "Running with $adders adders, $multipliers multipliers, 1 addTime, 1 mulTime"
        ./scheduler $input_file $adders $multipliers 1 1 > "logs/${input_file:0:3}_${adders}_${multipliers}.log"
    done
done
