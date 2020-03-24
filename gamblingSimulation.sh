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

#Uc5

days(){
winday=$(($won / $low))
lostday=$(($lost / $low))
echo "days of won is $winday"
echo "days of lost is $lostday"
}
days

#Uc6

findday(){
for ((i=0; i<20; i++))
do
	if [ ${arr[$i]} -eq $high ]
	then
		echo "Luckiest day $(($i + 1))"
	else
		echo "Unluckiest day $(($i + 1))"
	fi
done
}
findday

#Uc7

while [ true ]
do
if [ $winday -gt $lostday ]
then
	echo "You are win last month"
	echo -e "You want to continue...\n1:yes\n2:no"
	read ch
	if [ $ch == 'yes' ]
	then
		month
		days
		findday
	else
		exit
	fi
else
	echo "You are lost last month"
	exit
fi
done
