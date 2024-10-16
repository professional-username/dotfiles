{ config, pkgs, ... }:

{
  imports = [ ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.username = {
    isNormalUser = true;
    description = "username";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [
      kate
      swww
      #  thunderbird
    ];
  };

  # Set default user shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

}
