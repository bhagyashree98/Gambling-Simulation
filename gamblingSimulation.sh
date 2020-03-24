#!/bin/bash -x

#Uc1

day=0
stake=100
bet=1

#Uc2

bet(){
r=$((RANDOM % 2))
if [ $r -eq 1 ]
then
	start=$(($stake + 1))
else
	stake=$(($stake - 1))
fi
}
