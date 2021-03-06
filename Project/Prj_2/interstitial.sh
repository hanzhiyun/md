#!/bin/bash

awk '$1=="@@@@"' interstitial.log | tee interstitial.txt
i=0
while read -a num  
do  
    # echo "str@:"${num[0]}  
    # echo "atom:"${num[1]}   
    # echo "energy:"${num[2]}
    atom[$i]=${num[1]}
    energy[$i]=${num[2]}
    i=`expr $i + 1`
done < interstitial.txt  
# echo "atom: ${atom[0]}"
# echo "atom: ${atom[1]}"
# echo "energy: ${energy[0]}"
# echo "energy: ${energy[1]}"

Ev=`echo "scale=5; ${energy[1]} - ${energy[0]}*${atom[1]} / ${atom[0]}" |bc`
echo "self-interstitial formation energy is: $Ev eV" 
echo "self-interstitial formation energy is: $Ev eV" >> interstitial.txt
