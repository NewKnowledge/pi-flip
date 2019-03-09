#! /bin/bash

xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

chromium-browser --kiosk --noerrdialogs --disable-infobars https://chartio.com/new-knowledge/login/?next=%2Fnew-knowledge%2Ftv-health-dashboard%2F?present=1 &

sleep 20;
echo "About to hit Tab";
xdotool keydown Tab; xdotool keyup Tab;
echo "About to hit Return";
xdotool keydown Return; xdotool keyup Return;

echo "About to load channels";
loop_channels () {
    channels=`cat channels.config`

    for channel in $channels;
    do
        chromium-browser --kiosk --noerrdialogs --disable-infobars $channel &
    done
}

loop_channels;

while true; do
    xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
    sleep 300;
done
