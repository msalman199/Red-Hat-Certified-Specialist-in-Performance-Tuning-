#!/bin/bash
# Disk Performance Analysis Script

DATA_FILE="/var/log/sa/sa$(date +%d)"
REPORT_FILE="disk_analysis_report_$(date +%Y%m%d).txt"

echo "Disk Performance Analysis Report" > $REPORT_FILE
echo "Generated on: $(date)" >> $REPORT_FILE
echo "==================================" >> $REPORT_FILE

echo -e "\n1. Disk Utilization Overview:" >> $REPORT_FILE
sar -d -f $DATA_FILE | grep -E "(Average|DEV|tps|%util)" | tail -10 >> $REPORT_FILE

echo -e "\n2. High Disk Utilization Periods (>70%):" >> $REPORT_FILE
sar -d -f $DATA_FILE | awk '$NF != "%util" && NF>9 && $NF > 70 {print $1, $2, "Device:", $3, "Utilization:", $NF"%", "TPS:", $4}' >> $REPORT_FILE

echo -e "\n3. Disk Performance Summary:" >> $REPORT_FILE
sar -d -f $DATA_FILE | awk '
BEGIN {samples=0; total_tps=0; total_util=0}
$4 != "tps" && NF > 9 {
    samples++;
    total_tps += $4;
    total_util += $NF;
}
END {
    if(samples > 0) {
        avg_tps = total_tps/samples;
        avg_util = total_util/samples;
        print "Average TPS:", avg_tps;
        print "Average Disk Utilization:", avg_util"%";
    }
}' >> $REPORT_FILE

echo "Disk analysis complete. Report saved to: $REPORT_FILE"
cat $REPORT_FILE
