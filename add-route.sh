j=0
for i in `cat as*|cut -f 3 -d " "`
do
j=$((j+1))
sudo ip ro add $i via 192.168.1.1 1>/dev/null 2>/dev/null
m=$(expr $j % 100)
if [ $m -eq 99 ]
then 
echo $j
fi
done
