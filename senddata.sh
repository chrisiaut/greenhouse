#!/bin/bash
cd /root/greenhouse

#echo "test value=1"> /dev/udp/192.168.1.117/8070

LIGHT="$(./light_status.sh)"
TEMPERATURE=$(echo "scale=2; $(./get_temp.sh)/1000" | bc)
CONDENSATION="$(python get_analog.py 0)"

echo "light status: ${LIGHT}";
echo "Temperature: ${TEMPERATURE}";
echo "Condensation: ${CONDENSATION}";

echo "light value=${LIGHT}"> /dev/udp/192.168.1.117/8070
echo "temperature value=${TEMPERATURE}"> /dev/udp/192.168.1.117/8070
echo "condensation value=${CONDENSATION}"> /dev/udp/192.168.1.117/8070
