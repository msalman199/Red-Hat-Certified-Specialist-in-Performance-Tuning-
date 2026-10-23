#!/bin/bash
# Memory Stress Test Script

echo "Starting memory stress test..."

for i in {1..5}; do
    dd if=/dev/zero of=/tmp/memtest_$i bs=1M count=200 2>/dev/null &
done

sleep 90

rm -f /tmp/memtest_*
killall dd 2>/dev/null

echo "Memory stress test completed"
