{ lib, config, ... }:
let
  cfg = config.workstation.motd;
in
{
  # 1. The Interface
  options.workstation.motd = {
    enable = lib.mkEnableOption "custom Message of the Day";
    message = lib.mkOption {
      type = lib.types.str;
      default = "Welcome to the NixOS workstation!";
      description = "The greeting displayed upon SSH or console login.";
    };
  };

  # 2. The Implementation
  config = lib.mkIf cfg.enable {
    users.motd = cfg.message;
  };
}
