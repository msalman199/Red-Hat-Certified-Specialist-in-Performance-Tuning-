#!/bin/bash
# Memory Performance Analysis Script

DATA_FILE="/var/log/sa/sa$(date +%d)"
REPORT_FILE="memory_analysis_report_$(date +%Y%m%d).txt"

echo "Memory Performance Analysis Report" > $REPORT_FILE
echo "Generated on: $(date)" >> $REPORT_FILE
echo "===================================" >> $REPORT_FILE

echo -e "\n1. Memory Utilization Overview:" >> $REPORT_FILE
sar -r -f $DATA_FILE | grep -E "(Average|kbmemfree|kbmemused|%memused)" | tail -5 >> $REPORT_FILE

echo -e "\n2. High Memory Usage Periods (>80%):" >> $REPORT_FILE
sar -r -f $DATA_FILE | awk '$4 != "%memused" && NF>8 && $4 > 80 {print $1, $2, "Memory Used:", $4"%", "Available:", $6"KB"}' >> $REPORT_FILE

echo -e "\n3. Memory Efficiency Summary:" >> $REPORT_FILE
sar -r -f $DATA_FILE | awk '
BEGIN {samples=0; total_used=0; total_free=0}
$4 != "%memused" && NF > 8 {
    samples++;
    total_used += $4;
    total_free += $2;
}
END {
    if(samples > 0) {
        avg_used = total_used/samples;
        avg_free = total_free/samples;
        print "Average Memory Usage:", avg_used"%";
        print "Average Free Memory:", avg_free"KB";
    }
}' >> $REPORT_FILE

echo "Memory analysis complete. Report saved to: $REPORT_FILE"
cat $REPORT_FILE
