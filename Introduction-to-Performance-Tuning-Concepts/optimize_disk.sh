#!/bin/bash

echo "=== DISK I/O OPTIMIZATION ==="

optimize_scheduler() {
    local DISK=$1
    local SCHEDULER=$2

    if [ -f /sys/block/$DISK/queue/scheduler ]; then
        AVAILABLE=$(cat /sys/block/$DISK/queue/scheduler)
        echo "Available schedulers for $DISK: $AVAILABLE"

        if [[ $AVAILABLE == *"$SCHEDULER"* ]]; then
            echo "Setting $SCHEDULER scheduler for $DISK"
            echo $SCHEDULER | sudo tee /sys/block/$DISK/queue/scheduler
        else
            echo "Scheduler $SCHEDULER not available for $DISK, leaving default"
        fi

        echo "Current scheduler for $DISK:"
        cat /sys/block/$DISK/queue/scheduler
    fi
}

DISKS=$(lsblk -d -n -o NAME | grep -E "^sd|^nvme|^vd")

for DISK in $DISKS; do
    echo "Optimizing disk: $DISK"

    if [[ $DISK == nvme* ]]; then
        optimize_scheduler $DISK "none"
    else
        optimize_scheduler $DISK "mq-deadline"
    fi

    if [ -f /sys/block/$DISK/queue/read_ahead_kb ]; then
        echo "Setting read-ahead for $DISK to 128KB"
        echo 128 | sudo tee /sys/block/$DISK/queue/read_ahead_kb
    fi
done

echo ""
echo "Disk optimization complete"
