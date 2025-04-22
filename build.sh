#!/bin/bash

# Install Node.js (if not installed)
if ! command -v node &> /dev/null
then
    echo "Node.js not found! Installing..."
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Install dependencies and build
npm install
npm run build

