{
  programs.nixvim.keymaps = [
    # -------------------------------------------------------------
    # Copy (Ctrl+C)
    # -------------------------------------------------------------
    {
      mode = "v";
      key = "<C-c>";
      action = "\"+y";
      options = {
        silent = true;
        desc = "Copy selection";
      };
    }

    # -------------------------------------------------------------
    # Paste (Ctrl+V)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<C-v>";
      action = "\"+p";
      options = {
        silent = true;
        desc = "Paste after cursor";
      };
    }
    {
      mode = "i";
      key = "<C-v>";
      action = "<C-r>+";
      options = {
        silent = true;
        desc = "Paste inline";
      };
    }
    {
      mode = "v";
      key = "<C-v>";
      action = "\"_d\"+P";
      options = {
        silent = true;
        desc = "Paste over selection";
      };
    }

    # -------------------------------------------------------------
    # Undo (Ctrl+Z)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<C-z>";
      action = "u";
      options = {
        silent = true;
        desc = "Undo (normal mode)";
      };
    }
    {
      mode = "i";
      key = "<C-z>";
      action = "<cmd>undo<CR>";
      options = {
        silent = true;
        desc = "Undo (insert mode)";
      };
    }

    # -------------------------------------------------------------
    # Redo (Ctrl+Y)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<C-y>";
      action = "<C-r>";
      options = {
        silent = true;
        desc = "Redo (normal mode)";
      };
    }
    {
      mode = "i";
      key = "<C-y>";
      action = "<cmd>redo<CR>";
      options = {
        silent = true;
        desc = "Redo (insert mode)";
      };
    }

    # -------------------------------------------------------------
    # Save (Ctrl+S)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options = {
        silent = true;
        desc = "Save";
      };
    }
    {
      mode = "i";
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options = {
        silent = true;
        desc = "Save (insert mode)";
      };
    }

    # -------------------------------------------------------------
    # Quit (Ctrl+Q)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<C-q>";
      action = "<cmd>q<CR>";
      options = {
        silent = true;
        desc = "Quit (normal mode)";
      };
    }
    {
      mode = "i";
      key = "<C-q>";
      action = "<cmd>q<CR>";
      options = {
        silent = true;
        desc = "Quit (insert mode)";
      };
    }

    # -------------------------------------------------------------
    # Close (Ctrl+W)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<C-w>";
      action = "<cmd>close<CR>";
      options = {
        silent = true;
        desc = "Close (normal mode)";
      };
    }

    # -------------------------------------------------------------
    # Select entire line (Ctrl+L)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<C-l>";
      action = "<Esc>V";
      options = {
        silent = true;
        desc = "Select entire line";
      };
    }

    # -------------------------------------------------------------
    # Search forward (Ctrl+F)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<C-f>";
      action = "/";
      options = {
        desc = "Search forward (Ctrl+F)";
      };
    }

    # -------------------------------------------------------------
    # Clear search highlight (Esc)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options = {
        silent = true;
        desc = "Clear search highlight";
      };
    }
    # -------------------------------------------------------------
    # Next buffer (Tab)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = {
        silent = true;
        desc = "Next buffer";
      };
    }
    # -------------------------------------------------------------
    # Previous buffer (Shift+Tab)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = {
        silent = true;
        desc = "Previous buffer";
      };
    }
    # -------------------------------------------------------------
    # Delete buffer (\bd)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<CR>";
      options = {
        silent = true;
        desc = "Delete buffer";
      };
    }
    # -------------------------------------------------------------
    # Toggle file explorer (\e)
    # -------------------------------------------------------------
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      options = {
        silent = true;
        desc = "Toggle file explorer";
      };
    }
  ];
}
