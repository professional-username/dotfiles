# NixOS Configuration

My personal NixOS configuration managed as a flake, featuring a customized desktop environment with carefully chosen tools and applications.

![Screenshot 1](images/screenshot_1.png)
![Screenshot 2](images/screenshot_2.png)

## Features

- **Desktop Environment**: Hyprland-based setup with AGS for custom widgets and bars
- **Development Environment**:
  - Emacs configuration with projectile and development tools
  - Git configuration
  - Development environment management with devenv
- **Terminal**: 
  - Fish shell with starship prompt
  - Kitty terminal emulator
  - Various CLI tools including jrnl and rbw
- **Applications**:
  - Firefox with custom policies and profiles
  - Custom fonts and theming

## Installation

1. First, ensure you have a working NixOS installation
2. Clone this repository:
   ```bash
   git clone https://github.com/professional-username/dotfiles
   cd REPO_NAME
   ```
3. Install the flake:
   ```bash
   sudo nixos-rebuild switch --flake .#
   ```
4. For subsequent updates, you can use `nh`:
   ```bash
   nh os switch
   ```

## Hardware Compatibility

Please note that some additional setup may be required to make these dotfiles work with your specific hardware configuration. The configuration includes NVIDIA support, but you might need to adjust hardware-specific settings.

## Structure

- `home/`: Home-manager configurations
  - `desktop/`: Desktop environment configurations (Hyprland, AGS)
  - `development/`: Development tools and languages
  - `emacs/`: Emacs configuration
  - `terminal/`: Terminal and shell configurations
- `system/`: System-wide NixOS configurations
  - `hardware/`: Hardware-specific configurations
  - `software/`: System software and services

## License

Feel free to use and modify these configurations as you see fit.
