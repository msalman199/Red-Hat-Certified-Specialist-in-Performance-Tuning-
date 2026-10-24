#!/bin/bash

# Performance trend analysis script
LOG_DIR="monitoring_logs"

analyze_cpu_trends() {
    echo "=== CPU TREND ANALYSIS ==="

    local cpu_log
    cpu_log=$(ls -t "$LOG_DIR"/cpu_*.log 2>/dev/null | head -1)

    if [ -z "$cpu_log" ] || [ ! -f "$cpu_log" ]; then
        echo "No CPU log files found in $LOG_DIR. Run advanced_monitor.sh first."
        return 1
    fi

    echo "Analyzing CPU data from: $cpu_log"

    local avg_cpu max_cpu min_cpu
    avg_cpu=$(awk -F',' 'NR>1{sum+=$2; count++} END{if(count>0) printf "%.2f", sum/count; else print "0"}' "$cpu_log")
    max_cpu=$(awk -F',' 'NR>1{if($2>max || NR==2) max=$2} END{print max}' "$cpu_log")
    min_cpu=$(awk -F',' 'NR>1{if($2<min || NR==2) min=$2} END{print min}' "$cpu_log")

    echo "Average CPU Usage: $avg_cpu%"
    echo "Maximum CPU Usage: $max_cpu%"
    echo "Minimum CPU Usage: $min_cpu%"

    echo ""
    echo "Identify peak CPU sample (timestamp and value):"
    awk -F',' 'NR>1{if($2>max || NR==2){max=$2; ts=$1}} END{print ts", "max"%"}' "$cpu_log"
}

analyze_memory_trends() {
    echo ""
    echo "=== MEMORY TREND ANALYSIS ==="

    local mem_log
    mem_log=$(ls -t "$LOG_DIR"/memory_*.log 2>/dev/null | head -1)

    if [ -z "$mem_log" ] || [ ! -f "$mem_log" ]; then
        echo "No memory log files found in $LOG_DIR. Run advanced_monitor.sh first."
        return 1
    fi

    echo "Analyzing memory data from: $mem_log"

    local avg_mem max_mem
    avg_mem=$(awk -F',' 'NR>1{sum+=$5; count++} END{if(count>0) printf "%.2f", sum/count; else print "0"}' "$mem_log")
    max_mem=$(awk -F',' 'NR>1{if($5>max || NR==2) max=$5} END{print max}' "$mem_log")

    echo "Average Memory Usage: $avg_mem%"
    echo "Peak Memory Usage: $max_mem%"
}

check_alerts() {
    echo ""
    echo "=== ALERT SUMMARY ==="

    local alert_log
    alert_log=$(ls -t "$LOG_DIR"/alerts_*.log 2>/dev/null | head -1)

    if [ -z "$alert_log" ] || [ ! -s "$alert_log" ]; then
        echo "No alerts were triggered during the monitoring window."
    else
        echo "Alerts found in $alert_log:"
        cat "$alert_log"
    fi
}

# Main execution
analyze_cpu_trends
analyze_memory_trends
check_alerts

echo ""
echo "Trend analysis completed."
