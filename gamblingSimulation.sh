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

#Uc3

high=$(($stake + $(($stake / 2))))
low=$(($stake - $(($stake / 2))))
day(){
stake=100
while [ $stake -lt $high ] && [ $stake -gt $low ]
do
	bet
done
}

#Uc4
c=0
month(){
while [ $day -lt 20 ]
do
	day
	arr[$c]=$stake
	c=$(($c + 1))
	if [ $stake -eq 150 ]
	then 
		won=$(($won + 50))
	else
		lost=$(($lost + 50))
	fi
	day=$(($day + 1))
done
echo "Total won amount is $won"
echo "Total lost amount is $lost"
}
month
