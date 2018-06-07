#! /bin/bash
shopt -s -o nounset

declare -a processes
declare -a services

processes=('php-fpm' 'mysql' 'nginx')
services=('php7.0-fpm' 'mysql' 'nginx')
totalProcess=${#processes[@]}
sleepSecs=10


addLog()
{
    date=`date +%Y-%m-%d\ %H:%M:%S`
    msg="[$date] $service not exists"
    echo $msg
    echo $msg >> agent.log
}


for ((i=0; i<$totalProcess; i=i+1))
do
    process=${processes[i]}
    service=${services[i]}

    result=`pgrep $process`

    echo "$i  $service"

    if [ -z "$result" ]; then
        addLog $service
        sudo service $service start
        sleep $sleepSecs
    fi
done



echo OTAAgent Done
