#!/bin/sh

touch /var/log/tinyproxy/tinyproxy.log
chown tinyproxy:tinyproxy /var/log/tinyproxy/tinyproxy.log

tinyproxy 
openfortivpn