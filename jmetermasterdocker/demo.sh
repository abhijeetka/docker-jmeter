#!/bin/bash +x 

WORKSPACE=$1
#cd $WORKSPACE/jmeter/jmetermasterdocker


SlavesNumber=4;
hostip=$2
hostname=$3


echo "###################################### Giving Permission to Scripts ##############################################################";
echo -e "\t\t\t\n";
echo -e "\t\t giving executable  permissions to script and running the script";
echo -e "\t\t\t\n";
echo -e "##################################################################################################################################";

echo -e "######################################### Running Shell script ########################################################################";
echo -e "\t\t\t\n";
sudo chmod +x scriptnew.sh
sudo sh scriptnew.sh $WORKSPACE $SlavesNumber $hostip $hostname
echo -e "\t\t\t\n";
echo -e "######################################### End of Shell script #############################################################################";


echo  -e "##################################################################################################################################";
echo -e "\t\t\t\n";
echo -e "\t waiting for few seconds to properly up all  docker containers and checking whether they are running or not by docker ps";
sleep 5s;
echo -e "\t\t\t\n";
echo "##################################################################################################################################";
echo -e "\t\t\t\n";
echo -e "\t\t\t\n";
echo "####################################### Checking Running Docker container Status ######################################################";
echo -e "\t\t\t\n";
sudo docker ps
echo -e "\t\t\t\n";
echo "##################################################################################################################################";

echo -e "\t\t\t\n";echo -e "\t\t\t\n";
echo "############################## Waiting for Jmeter Test Case Execution ###########################################";
echo -e "\t\t\t\n";echo -e "\t\t\t\n";



   
for (( ; ; ))

do  
OUTPUT=$(sudo docker logs jmetermaster)
echo "Executing test cases";
#OUTPUT=$(sudo docker logs jmetermaster) >/dev/null 2>&1

if echo " $OUTPUT" | grep  -q "end of run";then
  echo "Completed all Jmeter test case execution on Remote Machines";
  echo $OUTPUT;
  break;
fi
done

echo "#############################Completed Jmeter Test Case Execution ############################################";
echo -e "\t\t\t\n";
echo "############################# Stopping All containers ########################################################";
echo -e "\t\t\t\n";


#sudo docker stop jmeterslave1 jmeterslave2 jmetermaster
#sudo docker rm -f jmeterslave1 jmeterslave2 jmetermaster
x=1;
no=`expr "$x" + "$SlavesNumber"`

echo $no;
sudo docker rm -f $(sudo docker ps -aq | head -$no);

echo -e "\t Checking Docker Status ";
echo -e "\n";
sudo docker ps
echo -e "\t\t\t\n";
echo "############################# Stopping All containers Completed ############################################";
echo -e "\t\t\t\n";echo -e "\t\t\t\n";

echo "############################# Aggregating all Test case Reports ############################################";
echo -e "\t\t\t\n";echo -e "\t\t\t\n";


