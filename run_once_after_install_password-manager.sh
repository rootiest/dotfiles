#!/bin/sh

# Configure VaultWarden Password Manager
bw config server $BW_SERVER
export BW_SESSION=$(bw login $BW_EMAIL --raw)