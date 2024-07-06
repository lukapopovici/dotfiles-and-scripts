#!/bin/bash

if ! command -v sensors &> /dev/null; then
    echo "lm-sensors package is not installed. Please install it using: sudo apt-get install lm-sensors"
    exit 1
fi

if ! command -v figlet &> /dev/null; then
    echo "figlet package is not installed. Please install it using: sudo apt-get install figlet"
    exit 1
fi

display_cpu_temp() {
    TEMP=$(sensors | grep 'Package id 0:' | awk '{print $4}' | tr -d '+°C')
    clear
    echo "CPU Temperature:"
    echo "$TEMP°C" | figlet
}

while true; do
    display_cpu_temp
    sleep 5
done
