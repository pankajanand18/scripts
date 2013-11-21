echo "Its going to run for $1 seconds"
a=$1
while [ $a -gt 0 ]
do
 echo "$a seconds remaing remaining"
 sleep 1
 a=`expr $a - 1`
done
