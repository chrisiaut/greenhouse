#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H%M")

fswebcam -r 1280x720 --no-banner /var/www/html/$DATE.jpg

cp /var/www/html/$DATE.jpg /var/www/html/latest.jpg
