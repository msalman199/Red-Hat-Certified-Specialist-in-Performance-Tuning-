#!/bin/bash
echo "Starting CPU-intensive process (PID $$)..."
END=$((SECONDS+30))
while [ $SECONDS -lt $END ]; do
    echo "scale=3000; 4*a(1)" | bc -l > /dev/null
done
echo "CPU-intensive process finished."
