#!/bin/bash

echo "=== CPU Performance Optimization ==="

# Check current CPU governor
echo "Current CPU governor:"
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# Set performance governor for better performance
echo "Setting CPU governor to performance mode..."
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
    echo performance > $cpu 2>/dev/null || echo "Could not set governor for $cpu"
done

# Optimize process priorities for critical services
echo "Optimizing process priorities..."
# Find and renice CPU-intensive processes
for pid in $(ps aux --sort=-%cpu | head -10 | awk 'NR>1 {print $2}'); do
    current_nice=$(ps -o pid,ni -p $pid | tail -1 | awk '{print $2}')
    if [ "$current_nice" -gt 0 ]; then
        renice -5 $pid 2>/dev/null && echo "Reniced process $pid"
    fi
done

# Disable unnecessary services
echo "Checking for unnecessary services..."
systemctl list-unit-files --type=service --state=enabled | grep -E "(bluetooth|cups)" | while read service; do
    service_name=$(echo $service | awk '{print $1}')
    echo "Consider disabling: $service_name"
done

echo "CPU optimization completed."
