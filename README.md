# Center Mouse (mcenter)

A Raycast command script that moves the mouse cursor to the center of a specified display

## Overview

This tool provides a function to quickly move the cursor to the center of a specified display when you lose track of your mouse cursor in a multi-display environment. It can be easily called from Raycast, and by setting a shortcut key, you can access it even more quickly.

## Features

- Support for multiple displays
- Ability to specify display number (default is 1)
- One-click execution from Raycast
- Shortcut key configuration available

## Requirements

- macOS
- [Raycast](https://www.raycast.com/)
- Swift (only required for compilation)

## Installation

1. Clone or download this repository
   ```bash
   git clone https://github.com/oishi/mcenter.git
   ```

2. Copy the `mcenter.sh` and `mcenter.swift` files to your Raycast command scripts directory
   ```bash
   cp mcenter.sh mcenter.swift ~/.raycast/scripts/
   ```

3. Open Raycast and run mcenter in the command palette (it will be automatically compiled on first run)

## How It Works

The tool uses macOS's CoreGraphics framework to retrieve a list of active displays and calculate the center coordinates of the specified display. It then uses the `CGWarpMouseCursorPosition` function to move the mouse cursor to those center coordinates.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Please report bugs or suggest features through GitHub Issues. Pull requests are also welcome.

## Author

- [oishi](https://raycast.com/oishi)
