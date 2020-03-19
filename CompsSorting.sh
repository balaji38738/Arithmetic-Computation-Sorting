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
	result4=`echo "scale=4; $number1 % $number2 + $number3" | bc`
}

#Function to print results of expressions
function printResults() {
	printf "\nExpressions' results\n"
	printf "$number1 + $number2 * $number3 = $result1\n"
	printf "$number1 * $number2 + $number3 = $result2\n"
	printf "$number3 + $number1 / $number2 = $result3\n"
	printf "$number1 %% $number2 + $number3 = $result4\n\n"
}

solveExpressions
printResults

declare -A exprResults	#Dictionary to store results of expressions

#Function to store expressions' results in dictionary
function storeResultsInDict() {
	exprResults[expr1]=$result1
	exprResults[expr2]=$result2
	exprResults[expr3]=$result3
	exprResults[expr4]=$result4
}

storeResultsInDict

echo "Keys: ${!exprResults[@]}"
echo "values: ${exprResults[@]}"

#Function to store dictionary values in array
function storeDictInArray() {
	index=0
	for result in "${exprResults[@]}"
	do
		resultsArray[((index++))]=$result
	done
}

storeDictInArray

echo -e "\nArray: ${resultsArray[@]}"
