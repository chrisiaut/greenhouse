#!/bin/bash
cd /root/greenhouse

#echo "test value=1"> /dev/udp/192.168.1.117/8070

LIGHT="$(./light_status.sh)"
VENT="$(./vent_status.sh)"
TEMPERATURE=$(echo "scale=2; $(./get_temp.sh)/1000" | bc)
CONDENSATION="$(python get_analog.py 0)"
HUMIDITY=$(echo "scale=2; ($(python get_analog.py 2)/1024)*100" | bc)

echo "Light status: ${LIGHT}";
echo "Vent status: ${VENT}";
echo "Temperature: ${TEMPERATURE}";
echo "Condensation: ${CONDENSATION}";
echo "Humidity: ${HUMIDITY}";

echo "light value=${LIGHT}"> /dev/udp/192.168.1.117/8070
echo "vent value=${VENT}"> /dev/udp/192.168.1.117/8070
echo "temperature value=${TEMPERATURE}"> /dev/udp/192.168.1.117/8070
echo "condensation value=${CONDENSATION}"> /dev/udp/192.168.1.117/8070
echo "humidity value=${HUMIDITY}"> /dev/udp/192.168.1.117/8070
