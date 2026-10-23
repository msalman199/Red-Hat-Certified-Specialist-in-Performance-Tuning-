#!/bin/bash
# Master Performance Analysis Script

DATA_FILE="/var/log/sa/sa$(date +%d)"
REPORT_DIR="/tmp/performance_reports"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
MASTER_REPORT="${REPORT_DIR}/master_performance_report_${TIMESTAMP}.txt"

mkdir -p $REPORT_DIR

{
echo "System Performance Analysis Report"
echo "Generated: $(date)"
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime)"
echo "===================================="

echo ""
echo "CPU Performance Summary"
sar -u -f $DATA_FILE | awk '
$3 != "%user" && NF > 6 {
    samples++; total_idle+=$8; total_user+=$3; total_system+=$5;
    util = 100-$8;
    if(util > max_util) max_util = util;
}
END {
    if(samples>0) {
        avg_util = 100 - (total_idle/samples);
        print "Average CPU Utilization: " avg_util "%";
        print "Peak CPU Utilization: " max_util "%";
        if (avg_util < 50) print "Status: GOOD";
        else if (avg_util < 80) print "Status: MODERATE";
        else print "Status: HIGH - Investigation needed";
    }
}'

echo ""
echo "Memory Performance Summary"
sar -r -f $DATA_FILE | awk '
$4 != "%memused" && NF > 8 {
    samples++; total_used+=$4;
    if($4 > max_used) max_used=$4;
}
END {
    if(samples>0) {
        avg_used = total_used/samples;
        print "Average Memory Usage: " avg_used "%";
        print "Peak Memory Usage: " max_used "%";
        if (avg_used < 70) print "Status: GOOD";
        else if (avg_used < 85) print "Status: MODERATE";
        else print "Status: HIGH - Investigation needed";
    }
}'

echo ""
echo "Disk Performance Summary"
sar -d -f $DATA_FILE | awk '
$4 != "tps" && NF > 9 {
    samples++; total_util+=$NF;
    if($NF > max_util) max_util=$NF;
}
END {
    if(samples>0) {
        avg_util = total_util/samples;
        print "Average Disk Utilization: " avg_util "%";
        print "Peak Disk Utilization: " max_util "%";
        if (avg_util < 50) print "Status: GOOD";
        else if (avg_util < 80) print "Status: MODERATE";
        else print "Status: HIGH - Investigation needed";
    }
}'

echo ""
echo "Performance Optimization Recommendations"
echo "1. CPU: monitor top offenders with top/htop; consider affinity or scaling."
echo "2. Memory: review memory-intensive processes; watch for swap growth."
echo "3. Disk: consider faster storage or I/O scheduler tuning for high-util devices."
echo "4. Establish baselines and enable ongoing automated monitoring (see Subtask 3.3)."
} > $MASTER_REPORT

echo "Master performance report generated: $MASTER_REPORT"
cat $MASTER_REPORT
