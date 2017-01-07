#!/bin/bash
while true
do
    POWER_STATE=$(ioreg -n IODisplayWrangler | grep -i IOPowerManagement | sed 's/.*"CurrentPowerState"=\([0-9]\).*/\1/')
    if [ $POWER_STATE -eq 4 ]
    then
        osascript -e 'display notification "Take a break!" with title "Break reminder"'
    fi
    sleep 600
done
