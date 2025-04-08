#!/bin/bash
set -e

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "Virtual environment not found. Running setup script first..."
    ./setup.sh
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Start the FastAPI server
echo "Starting health check server on port 7777..."
python app.py 