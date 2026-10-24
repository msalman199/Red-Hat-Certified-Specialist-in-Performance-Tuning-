#!/bin/bash

echo "Starting load test..."

stress-ng --vm 2 --vm-bytes 256M --timeout 20s &
dd if=/dev/zero of=/tmp/testfile bs=1M count=100 oflag=direct &

wait
rm -f /tmp/testfile

echo "Load test completed"
