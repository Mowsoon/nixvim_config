{
    programs.nixvim.plugins.lsp = {
        enable = true;
        inlayHints = true;

        servers = {
            nil_ls.enable = true;
            gopls.enable = true;
            bashls.enable = true;
            clangd.enable = true;
            rust_analyzer.enable = true;
            pyright.enable = true;
            tsserver.enable = true;
            jsonls.enable = true;
            yamlls.enable = true;
            html.enable = true;
            cssls.enable = true;
            sumneko_lua.enable = true;
            terraformls.enable = true;
        };

        keymaps = {
            silent = true;
            lspBuf = {
                "gd" = "definition";
                "gD" = "declaration";
                "gi" = "implementation";
                "gr" = "references";
                "K" = "hover";
                "<leader>rn" = "rename";
                "<leader>ca" = "code_action";
                "<leader>f" = "format";
            };
            diagnostic = {
                "[d" = "goto_prev";
                "]d" = "goto_next";
                "<leader>d" = "open_float";
            };
        };
    };
}