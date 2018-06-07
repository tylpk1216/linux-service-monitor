#! /bin/bash
shopt -s -o nounset

declare -a processes
declare -a services

# your service process name to monitor
processes=('php-fpm' 'mysql' 'nginx')

# your service name to start
services=('php7.0-fpm' 'mysql' 'nginx')

# monitor interval
sleepSecs=10

totalProcess=${#processes[@]}

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


echo agent work is done

