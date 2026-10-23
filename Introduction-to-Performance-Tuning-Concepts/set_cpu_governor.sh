#!/bin/bash

echo "=== CPU GOVERNOR CONFIGURATION ==="

if [ ! -d /sys/devices/system/cpu/cpu0/cpufreq ]; then
    echo "cpufreq interface not available in this environment (common on virtualized/cloud CPUs)."
    echo "Skipping governor change."
    exit 0
fi

if [ -f /sys/class/power_supply/ADP1/online ]; then
    POWER_SOURCE=$(cat /sys/class/power_supply/ADP1/online)
    if [ "$POWER_SOURCE" -eq 1 ]; then
        echo "AC Power detected - Setting performance governor"
        sudo cpupower frequency-set -g performance
    else
        echo "Battery power detected - Setting powersave governor"
        sudo cpupower frequency-set -g powersave
    fi
else
    echo "Server/Desktop system - Setting performance governor"
    sudo cpupower frequency-set -g performance
fi

echo "Current CPU governor:"
cpupower frequency-info | grep "current policy" 2>/dev/null || echo "Unable to query policy on this system"
