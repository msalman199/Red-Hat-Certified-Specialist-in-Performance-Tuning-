#!/bin/bash
# Disk I/O Stress Test Script

TEST_DIR="/tmp/disk_test"
mkdir -p $TEST_DIR

echo "Starting disk I/O stress test..."

dd if=/dev/zero of=${TEST_DIR}/seq_write_test bs=1M count=200 conv=fsync
dd if=/dev/urandom of=${TEST_DIR}/random_test bs=4k count=5000 oflag=direct
dd if=${TEST_DIR}/random_test of=/dev/null bs=4k iflag=direct

rm -rf $TEST_DIR
echo "Disk stress test completed"
