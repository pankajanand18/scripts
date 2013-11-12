counter=1020
while [ $counter -le 1050 ] 
do
 counter=`expr $counter + 1`
 filename="$counter.xml"
 echo $filename
 cp 1000.xml $filename
 sed -i "s/1000/$counter/g" $filename
done
