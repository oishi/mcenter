#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title mcenter
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Display Number", "optional": true }

# Documentation:
# @raycast.description move mouse to center of screen
# @raycast.author oishi
# @raycast.authorURL https://raycast.com/oishi

# Get the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Binary path
BINARY_PATH="${SCRIPT_DIR}/mcenter"
SOURCE_PATH="${SCRIPT_DIR}/mcenter.swift"

# Compile if binary doesn't exist
if [ ! -f "$BINARY_PATH" ]; then
  echo "Binary not found. Compiling..."
  swiftc -o "$BINARY_PATH" "$SOURCE_PATH"
  
  # If compilation fails
  if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
  fi
  
  echo "Compilation complete"
fi

# Default display index (can be modified for different environments)
DEFAULT_DISPLAY_INDEX=1

# Get command line arguments
DISPLAY_INDEX=${1:-$DEFAULT_DISPLAY_INDEX}

# Run the compiled executable
"$BINARY_PATH" "$DISPLAY_INDEX"
