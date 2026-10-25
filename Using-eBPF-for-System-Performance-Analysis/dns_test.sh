#!/bin/bash
echo "Starting DNS resolution tests..."

websites=(
    "google.com"
    "github.com"
    "stackoverflow.com"
    "redhat.com"
    "ubuntu.com"
    "kernel.org"
    "python.org"
    "nginx.org"
    "apache.org"
    "cloudflare.com"
)

for site in "${websites[@]}"; do
    echo "Resolving $site..."
    nslookup "$site" > /dev/null 2>&1
    host "$site" > /dev/null 2>&1
    dig "$site" > /dev/null 2>&1
    sleep 1
done

echo "DNS tests completed"
