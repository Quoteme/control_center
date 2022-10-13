#!/usr/bin/env bash

if ps -e | grep -q "control_center"; then
    # control_center is running
    pkill control_center
else
    # control_center is not running
    control_center
fi
