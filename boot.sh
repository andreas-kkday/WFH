#!/bin/bash
function addRoute() {
    j=0
        for i in `cat kkskip`
            do
                j=$((j+1))
		    sudo /sbin/route add $i $gw 1>/dev/null 2>/dev/null
                    #sudo ip ro add $i via $gw 1>/dev/null 2>/dev/null
                    m=$(expr $j % 100)
                    if [ $m -eq 99 ]
                        then
                            echo $j
                            fi
                            done
}

#function kkday() {
#    rm -f kkday_table

#        for i in `cat kkday_host`
#            do
#                host $i|grep -v IPv6|grep address | awk '{print $4}' >> kkday_table
#                    done
#                    sudo pfctl -t kkday -T replace -f ./kkday_table
#                    echo "pass out quick on utun3 from utun3 to <kkday>" > pf.conf
#}

outif=`netstat -nr|grep default|awk '{print $4}'|grep -v tun|head -n 1`	#first output interface exclude tun
gw=`netstat -nr|grep default|grep $outif |awk '{print $2}'`

echo "Interface $outif, gateway $gw"

#sudo pfctl -t kkskip -T replace -f ./kkskip

#echo "pass out on utun3 route-to $outif from utun3 to <kkskip>" > pf.conf
#echo "pass out on $outif route-to $outif from $outif to <kkskip>" >> pf.conf
#sudo pfctl -f pf.conf

#sudo pfctl -E

addRoute
