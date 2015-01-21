#!/bin/bash

# setup iptables for pptpd inside docker
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# start pptpd
pptpd -f
