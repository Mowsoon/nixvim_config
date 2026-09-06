{
  imports = [
    ../../modules/core/motd.nix
    ../../modules/desktop/plasma.nix
  ];

  nixpkgs.config.allowUnfree = true;

  services.xserver.xkb.layout = "fr";
  console.keyMap = "fr";

  virtualisation = {
    sharedDirectories = {
      nixos-config = {
        source = "/home/alban/nixvim-config";
        target = "/mnt/nixvim-config";
      };
    };
    vmVariant = {
      virtualisation = {
        memorySize = 8192;
        cores = 4;
      };
    };
  };

  environment.sessionVariables = {
    TERMINAL = "alacritty";
  };

  workstation.motd = {
    enable = true;
    message = "Advanced VM Configuration Active.";
  };

  networking.hostName = "vm-test";
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.testuser = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    initialPassword = "test";
  };

  home-manager.users.testuser = {
    imports = [
      ../../modules/editor/nixvim.nix
    ];

    home.stateVersion = "24.11";

    programs = {
      bash = {
        enable = true;
        enableCompletion = true;
        shellAliases = {
          ll = "ls -l";
          update = "sudo nixos-rebuild switch --flake /mnt/nixos-config#vm-test";
        };
      };

      alacritty = {
        enable = true;
        settings = {
          font.normal.family = "JetBrainsMono Nerd Font";
          font.size = 11.0;
          window.padding = {
            x = 4;
            y = 4;
          };
        };
      };
    };

  };
  security.sudo.wheelNeedsPassword = false;
  system.stateVersion = "24.11";
}
