#!/bin/bash 

# Ask the user for an IP address
read -p " PLEASE ENTER THE IP ADDRESS YOU WANT TO TEST" ip_address

#pinging the IP ADDRESS
echo "pinging $ip_address"
ping -c 10 $ip_address

#check the exit status of the ping command
if [$? -eq 0]; then
    echo "ping is successful"
#ssh into the device
ssh admin@$ip_address <<EOF
    echo " HERE IS THE DEVICE UPTIME!!!!! "
    uptime
    uname -a
    iwlist ath0 scan
    echo ".............................................................."
EOF
else 
    echo "Ping failed, the host may be unreachable."
fi
