#!/bin/sh
export BW_SERVER="https://vault.rootiest.dev"
# Configure VaultWarden Password Manager
bw config server $BW_SERVER
export BW_SESSION=$(bw login $BW_EMAIL --raw)