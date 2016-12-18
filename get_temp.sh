cat /sys/bus/w1/devices/10-00080224e359/w1_slave | grep t | awk '{print $10}' | sed 's/..//'
