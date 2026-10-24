#!/bin/bash

# CPU and memory baseline monitoring script
LOG_FILE="cpu_usage_log.txt"
DURATION=60   # 1 minute for baseline
INTERVAL=5    # 5 seconds

echo "Starting baseline monitoring for $DURATION seconds..."
echo "Timestamp,CPU_Usage_Percent,Mem_Used_MB,Mem_Total_MB" > "$LOG_FILE"

for ((i=1; i<=DURATION/INTERVAL; i++)); do
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $4}' | awk '{print $1}')
    CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)
    MEM_USED=$(free -m | awk 'NR==2{print $3}')
    MEM_TOTAL=$(free -m | awk 'NR==2{print $2}')
    echo "$TIMESTAMP,$CPU_USAGE,$MEM_USED,$MEM_TOTAL" >> "$LOG_FILE"
    sleep $INTERVAL
done

echo "Baseline monitoring completed. Check $LOG_FILE for results."
