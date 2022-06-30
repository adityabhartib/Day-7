#!/bin/bash -x
WAGE_PER_HOUR=20
FULL_DAY_WORKING_HOUR=8
HALF_DAY_WORKING_HOUR=4
Dailywage=0
Total_working_hours=0
days=0

function gethours(){
        dailyHrs=$1
      case $dailyHrs in
              0)
                       dailyHrs=0
                       ;;
              1)
                       dailyHrs=$FULL_DAY_WORKING_HOUR
	               ;;
              2)
                       dailyHrs=$HALF_DAY_WORKING_HOUR
	               ;;
       esac
       echo $dailyHrs
}

while  [[ Total_working_hours -le 100 && days -le 20 ]]
do
	attendance=$((RANDOM%3))
	hrs=$(gethours $attendance)
	Dailywage[$days]=$(( $hrs * $WAGE_PER_HOUR ))
	Total_working_hours=$(( $Total_working_hours + $hrs ))
	days=$(($days+1))
done

echo "Total working hours $Total_working_hours"
echo "Daily wage : ${Dailywage[@]}"
