#!/bin/bash
set -e

# Install uv if not already installed
if ! command -v uv &> /dev/null; then
    echo "Installing uv package manager..."
    curl -sSf https://astral.sh/uv/install.sh | sh
    # Make sure uv is in the PATH
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Create a virtual environment
echo "Creating virtual environment with uv..."
uv venv .venv

# Activate the virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Install dependencies
echo "Installing dependencies with uv..."
uv pip install -r requirements.txt

echo "Setup complete! Virtual environment created and dependencies installed."
echo "To activate the environment run: source .venv/bin/activate"
echo "To start the health check server run: ./start.sh" 