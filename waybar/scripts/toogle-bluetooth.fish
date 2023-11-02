#!/usr/bin/fish

if [ (bluetoothctl show | grep "Powered: yes" | count) = 1 ]
   bluetoothctl power off > /dev/null
else
   bluetoothctl power on > /dev/null
end
