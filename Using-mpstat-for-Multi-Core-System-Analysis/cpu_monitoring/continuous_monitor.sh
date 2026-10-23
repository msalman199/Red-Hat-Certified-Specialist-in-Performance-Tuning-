#!/bin/bash

LOG_DIR="$HOME/cpu_monitoring/logs"
mkdir -p "$LOG_DIR"

DATE_STR=$(date +%Y%m%d)
LOG_FILE="$LOG_DIR/cpu_monitor_$DATE_STR.log"

# Function to log with timestamp
log_with_timestamp() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Function to check CPU thresholds
check_cpu_thresholds() {
    # Get current CPU utilization
    CPU_UTIL=$(mpstat 1 3 | grep "Average" | grep -v "CPU" | awk '{print $4+$6}')
    
    for util in $CPU_UTIL; do
        if (( $(echo "$util > 80" | bc -l) )); then
            log_with_timestamp "HIGH CPU ALERT: CPU utilization at ${util}%"
            
            # Log top processes
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] Top CPU processes:" >> "$LOG_FILE"
            ps aux --sort=-%cpu | head -5 >> "$LOG_FILE"
        fi
    done
}

# Main monitoring loop
log_with_timestamp "CPU monitoring started"

while true; do
    # Log current CPU stats
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] CPU Statistics:" >> "$LOG_FILE"
    mpstat -P ALL 1 1 | grep -E "(Average|CPU)" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    
    # Check thresholds
    check_cpu_thresholds
    
    # Sleep for 5 minutes
    sleep 300
done
