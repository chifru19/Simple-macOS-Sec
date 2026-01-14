#!/bin/bash

echo "--- macOS Security Audit (2026) ---"
date
echo "-----------------------------------"

# 1. Check Firewall State
echo "[*] Checking Firewall..."
fwall_state=$(/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate)
echo "    Status: $fwall_state"

# 2. Check Stealth Mode
echo "[*] Checking Stealth Mode..."
stealth_state=$(/usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode)
echo "    $stealth_state"

# 3. Check for External Network Listeners
echo "[*] Identifying External Network Listeners (Excluding Localhost)..."
# This looks for processes listening on all interfaces (0.0.0.0 or *) 
listeners=$(sudo lsof -i -P -n | grep LISTEN | grep -v '127.0.0.1')

if [ -z "$listeners" ]; then
    echo "    None found (Your system is quiet to the network)."
else
    echo "$listeners"
fi

# 4. Check Active Sharing Services
echo "[*] Checking Active Sharing Services..."
sharing_services=("com.apple.smbd" "com.apple.screensharing" "com.apple.ssh-proxy")
for service in "${sharing_services[@]}"; do
    if launchctl list | grep -q "$service"; then
        echo "    ALERT: $service is ACTIVE"
    fi
done

echo "-----------------------------------"
echo "Audit Complete."

