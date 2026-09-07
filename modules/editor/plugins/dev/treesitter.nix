{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        angular
        awk
        bash
        c
        cpp
        css
        caddy
        cmake
        dockerfile
        gitcommit
        gitignore
        go
        goctl
        gomod
        gosum
        groovy
        html
        java
        javascript
        json
        json5
        latex
        lua
        make
        markdown
        mermaid
        nix
        ocaml
        perl
        php
        puppet
        python
        regex
        requirements
        rust
        sql
        ssh-config
        terraform
        toml
        tsv
        tsx
        typescript
        vim
        vue
        xml
        yaml
        zig
        zsh
      ];

      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };

        indent = {
          enable = true;
        };

        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<Enter>";
            node_incremental = "<Enter>";
            scope_incremental = false;
            node_decremental = "<BS>";
          };
        };
      };

      nixvimInjections = true;
    };

    treesitter-context = {
      enable = true;

      settings = {
        max_lines = 3;
        min_window_height = 20;
        line_numbers = true;
        mode = "cursor";
      };
    };

    treesitter-textobjects = {
      enable = true;

      settings = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "aa" = "@parameter.outer";
            "ia" = "@parameter.inner";
          };
        };
        move = {
          enable = true;
          set_jumps = true;
          goto_next_start = {
            "]m" = "@function.outer";
            "]]" = "@class.outer";
          };
          goto_previous_start = {
            "[m" = "@function.outer";
            "[[" = "@class.outer";
          };
        };
      };
    };
  };
}
