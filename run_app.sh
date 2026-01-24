#!/bin/bash

# Create a virtual environment if it doesn't exist
if [ ! -d "Frontend-code/Frontend-vscode/env" ]; then
    python3 -m venv Frontend-code/Frontend-vscode/env
fi

# Activate the virtual environment
source Frontend-code/Frontend-vscode/env/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the application
python Frontend-code/Frontend-vscode/app.py
