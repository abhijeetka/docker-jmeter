#!/bin/sh
#service apache2 restart
 cd /usr/share/jmeter/bin
 pwd
rm jmeter.properties

cp /jmeter.properties .

 cp jmeter-server jmeter-server.sh
 chmod +x jmeter jmeter-server *.sh
echo "server.rmi.localport=50000">>jmeter.properties
echo "modified jmeter.properties"



#echo "172.27.59.35 dev.alm-task-manager.com">>/etc/hosts
echo "$HOSTIP $HOSTNAMES">>/etc/hosts

echo "er">>/usr/demo.txt
echo "made entry in hosts"
sh jmeter-server.sh

