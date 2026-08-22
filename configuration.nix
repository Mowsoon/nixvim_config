{ config, pkgs, ... }:

{
    networking.hostName = "vm-test";

    time.timeZone = "Europe/Paris";
    i18n.defaultLocale = "en_US.UTF-8";

    environment.systemPackages = with pkgs; [
        git
        curl
        vim
        htop
    ];

    users.users.testuser = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        initialPassword = "test";
    };

    security.sudo.wheelNeedsPassword = false;

    system.stateVersion = "24.11";
}