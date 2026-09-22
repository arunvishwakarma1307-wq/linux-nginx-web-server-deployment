#!/bin/bash

# =====================================================================
#     AUTOMATED INFRASTRUCTURE MONITORING & TELEMETRY ALERT ENGINE
# =====================================================================

# 1. Define Resource Threshold Limit (80% Safety Ceiling)
RAM_THRESHOLD=80

# 2. Extract Native Live System Metrics via Text-Parsing Arrays
TOTAL_RAM=$(free | grep Mem | awk '{print $2}')
USED_RAM=$(free | grep Mem | awk '{print $3}')

# 3. Execute Mathematical Integer Calculation
RAM_USAGE_PCT=$(( USED_RAM * 100 / TOTAL_RAM ))

# 4. Fetch Precise Time Logs
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S_UTC")

# 5. Conditional Execution Check (Threshold Check)
if [ $RAM_USAGE_PCT -gt $RAM_THRESHOLD ]; then
    # CRITICAL ALERT LOG ENTRY
    echo "[🚨 ALERT] $TIMESTAMP - Resource Breach! Live RAM Usage is at ${RAM_USAGE_PCT}% (Threshold: ${RAM_THRESHOLD}%)" >> server_alerts.log
else
    # HEALTHY STABILITY METRICS RECORD
    echo "[🟢 HEALTHY] $TIMESTAMP - System Optimized. Live RAM Usage is at ${RAM_USAGE_PCT}%" >> server_alerts.log
fi
