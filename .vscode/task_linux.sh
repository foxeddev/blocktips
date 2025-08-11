#!/bin/bash

if [ ! -d .venv ]; then
    python3 -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
    sleep 0.1
else
    source .venv/bin/activate
    sleep 0.1
fi

clear
beet watch
