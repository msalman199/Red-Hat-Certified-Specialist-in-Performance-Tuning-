#!/bin/bash

LOG_DIR="$HOME/cpu_monitoring/logs"
ARCHIVE_DIR="$HOME/cpu_monitoring/archive"

mkdir -p "$ARCHIVE_DIR"

# Compress logs older than 7 days
find "$LOG_DIR" -name "cpu_monitor_*.log" -mtime +7 -exec gzip {} \;

# Move compressed logs to archive
find "$LOG_DIR" -name "cpu_monitor_*.log.gz" -exec mv {} "$ARCHIVE_DIR/" \;

# Remove archives older than 30 days
find "$ARCHIVE_DIR" -name "cpu_monitor_*.log.gz" -mtime +30 -delete

echo "Log rotation completed: $(date)"
