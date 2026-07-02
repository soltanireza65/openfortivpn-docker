#!/bin/sh
set -eu

# cleanup() {
#   [ -n "${VPN_PID-}" ] && kill -TERM "$VPN_PID" 2>/dev/null || true
#   [ -n "${TP_PID-}" ] && kill -TERM "$TP_PID" 2>/dev/null || true
# }
# trap cleanup INT TERM QUIT

# openfortivpn -c /etc/openfortivpn/config &
# VPN_PID=$!

# count=0
# while [ ! -d /sys/class/net/ppp0 ] && [ "$count" -lt 60 ]; do
#   sleep 1
#   count=$((count + 1))
# done

# if [ ! -d /sys/class/net/ppp0 ]; then
#   echo "PPP interface did not appear after 60 seconds" >&2
#   cleanup
#   exit 1
# fi

# tinyproxy -c /etc/tinyproxy/tinyproxy.conf &
# TP_PID=$!

# wait "$VPN_PID"
# cleanup
# wait "$TP_PID" 2>/dev/null || true






openfortivpn -c /etc/openfortivpn/config &

tinyproxy -d -c /etc/tinyproxy/tinyproxy.conf


