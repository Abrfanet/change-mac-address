#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Function to generate a random MAC address
generate_random_mac() {
  hexchars="0123456789ABCDEF"
  echo "00:60:2f$( for i in {1..3}; do echo -n ${hexchars:$(( $RANDOM % 16 )):1}${hexchars:$(( $RANDOM % 16 )):1}; done | sed 's/\(..\)/:\1/g' )"
}

# Interface to change the MAC address
INTERFACE=$1

if [ -z "$INTERFACE" ]; then
  echo "Usage: $0 <network-interface>"
  exit 1
fi

# Generate a random MAC address
NEW_MAC=$(generate_random_mac)

# Change the MAC address
sudo ip link set dev $INTERFACE down
sudo ip link set dev $INTERFACE address $NEW_MAC
sudo ip link set dev $INTERFACE up

# Verify the change
ip link show $INTERFACE

echo "MAC address for $INTERFACE changed to $NEW_MAC"
