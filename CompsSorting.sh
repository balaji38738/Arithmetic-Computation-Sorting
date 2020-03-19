#!/bin/bash -x

#Problem Statement:- Sort the results of arithmetic expressions in ascending and descending order
#Author:- Balaji Ijjapwar
#Date:- 20 March 2020

read -p "Enter three numbers: " number1 number2 number3

#Function to solve the expressions
function solveExpressions() {
	result1=`echo "scale=4; $number1 + $number2 * $number3" | bc`
	result2=`echo "scale=4; $number1 * $number2 + $number3" | bc`
	result3=`echo "scale=4; $number3 + $number1 / $number2" | bc`
}

#Function to print results of expressions
function printResults() {
	printf "Expressions' results\n"
	printf "$number1 + $number2 * $number3 = $result1\n"
	printf "$number1 * $number2 + $number3 = $result2\n"
	printf "$number3 + $number1 / $number2 = $result3\n"
}

solveExpressions
printResults
