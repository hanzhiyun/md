#!/bin/bash
# eval $(awk 'BEGIN{print "var1='str1';var2='str2'"}')
# echo "var1=$var1 ----- var2=$var2"
file="test.txt"
eval $(awk 'BEGIN{print "var3=3";i=0;} {if($0=="ITEM: ATOMS id xs ys zs c_3 c_4 c_5 "){print "num[$i]="NR"";i+=1;}}' $file)
echo "num=${num}"
