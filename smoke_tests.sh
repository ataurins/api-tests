#!/bin/sh

# cucumber --format html --out test-outputs/report-$(date).html
# New comment
while true
do
	cucumber --format progress -c --format html --out test-output/report_$(date +%T).html
	sleep 15
done
