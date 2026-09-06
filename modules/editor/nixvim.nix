{

  imports = [
    ./keymaps.nix
    ./opts.nix
    ./autoCmd.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
