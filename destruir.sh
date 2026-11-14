#!/bin/bash
sudo clab destroy -t netlab.clab.yml --cleanup
sudo ip link delete sw-a type bridge 2>/dev/null
sudo ip link delete sw-b type bridge 2>/dev/null
