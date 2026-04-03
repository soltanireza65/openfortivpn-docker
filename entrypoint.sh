#!/bin/sh
set -eux

tinyproxy -c /etc/tinyproxy/tinyproxy.conf & exec openfortivpn -c /etc/openfortivpn/config
