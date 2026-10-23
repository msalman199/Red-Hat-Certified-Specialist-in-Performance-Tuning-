#!/bin/bash
# CPU Stress Test Script

echo "Starting CPU stress test..."

cpu_load() {
    local duration=$1
    local cores=$2

    for ((i=1; i<=cores; i++)); do
        yes > /dev/null &
    done

    sleep "$duration"
    killall yes
}

echo "Phase 1: Light CPU load"
cpu_load 60 2

sleep 15

echo "Phase 2: Heavy CPU load"
cpu_load 90 4

echo "CPU stress test completed"
