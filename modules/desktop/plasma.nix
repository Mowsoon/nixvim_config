{ pkgs, ... }:
{
  # Enable the X11 windowing system for Xwayland support
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment
  services = {
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };

  # Base fonts for the terminal and UI
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  # Exclude default applications to maintain a minimal footprint
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    elisa
  ];
}
