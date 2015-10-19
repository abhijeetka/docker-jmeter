pwd;
#export PATH=$PATH:/opt/apachejmeter/apache-jmeter-2.13/bin
export host=dev.alm-task-manager.com
#directory where generic jmeter test file is present
workDirDemo=.
cd $workDirDemo
ls -lrt
pwd;
#jmeter --help

#jmeter -n -t url-benchmarknew.jmx -Jusers=50 -Jcount=10 -l report1.xml

jmeter -n -t url-benchmarknew.jmx -Jusers=50 -Jcount=10 -Jhost=$host -l report2.xml


cp ./report2.xml   $WORKSPACE
#cp  ./*.jmx   $WORKSPACE

