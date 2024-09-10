{ config, pkgs, ... }:

{

  # Bootloader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/nvme0n1p1";
  # boot.loader.efi.canTouchEfiVariables = true;

  # Enable emulation of other systems
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    theme = ./grub-theme;
  };

  time.hardwareClockInLocalTime = true;
}
