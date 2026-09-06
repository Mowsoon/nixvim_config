{
  imports = [
    ../../modules/core/motd.nix
    ../../modules/desktop/plasma.nix
  ];

  nixpkgs.config.allowUnfree = true;


  virtualisation = {
    sharedDirectories = {
      nixos-config = {
        source = "/home/alban/nixos-config";
        target = "/mnt/nixos-config";
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

      nixvim = {
        enable = true;
        defaultEditor = true;

        nixpkgs.useGlobalPackages = true;

        opts = {
          mouse = "a";
          clipboard = "unnamedplus";
          number = true;
          relativenumber = false;
          scrolloff = 8;
          wrap = false;
          tabstop = 4;
          shiftwidth = 4;
        };

        plugins = {
          neo-tree = {
            enable = true;
            settings = {
              enable_diagnostics = true;
              enable_git_status = true;
              close_if_last_window = true;
            };
          };
          windsurf-vim.enable = true;
        };

        keymaps = [
          {
            mode = "n";
            key = "<C-b>";
            action = "<cmd>Neotree toggle<CR>";
            options = {
              desc = "Toggle Neo-tree";
            };
          }
          {
            mode = "v";
            key = "<C-c>";
            action = "\"+y";
          }
        ];

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
