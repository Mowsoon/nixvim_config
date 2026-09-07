{
  programs.nixvim.opts = {
    # Indent
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    softtabstop = 2;
    autoindent = true;
    smartindent = true;

    # UI
    number = true;
    relativenumber = true;
    cursorline = true;
    wrap = true;
    breakindent = true;
    linebreak = true;
    scrolloff = 10;
    sidescrolloff = 0;
    signcolumn = "yes";
    termguicolors = true;
    colorcolumn = "100";

    # Search
    ignorecase = true;
    smartcase = true;
    hlsearch = true;
    incsearch = true;
    inccommand = "nosplit";
    wrapscan = true;
    magic = true;

    # System & Files
    clipboard = "unnamedplus";
    mouse = "a";
    undofile = true;
    swapfile = false;
    updatetime = 250;
    timeoutlen = 300;
    confirm = true;
    autoread = true;
    backup = false;
    writebackup = false;

    # Splits
    splitbelow = false;
    splitright = true;

    # Folding
    foldenable = true;
    foldmethod = "expr";
    foldexpr = "v:lua.vim.treesitter.foldexpr()";
    foldlevel = 99;
    foldlevelstart = 99;

  };
}
