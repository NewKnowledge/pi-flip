#! /bin/bash

loop_channels () {
    channels=`cat channels.config`

    for channel in $channels;
    do
        echo $channel;
        sleep 5;
    done
}

while true;
do
    loop_channels;
done
