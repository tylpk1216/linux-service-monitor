# linux-service-monitor
The script will monitor your services, and will start the service if it is not running.

You can add your service process in processes array and service name in services array.

You can also modify sleepSecs to decide your check interval.

If you want to do more things, you can also modify this script to send email or do something.

I hope this script is useful to you.

### user controllable variables
```
# your service process name to monitor
processes=('php-fpm' 'mysql' 'nginx')

# your service name to start
services=('php7.0-fpm' 'mysql' 'nginx')

# monitor interval
sleepSecs=10
```

### Do more things not only log
You can do anything you want to do here.
```
addLog()
{
    date=`date +%Y-%m-%d\ %H:%M:%S`
    msg="[$date] $service not exists"
    echo $msg
    echo $msg >> agent.log
}
```
