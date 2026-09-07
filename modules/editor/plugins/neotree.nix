{
    programs.nixvim.plugins.neotree = {
        enable = true;

        settings = {
            close_if_last_window = true;
            popup_border_style = "rounded";
            enable_git_status = true;
            enable_diagnostics = true;
            auto_clean_after_session_restore = true;

            window = {
                position = "left";
                width = 32;
                auto_expand_width = true;
                mappings = {
                    "<CR>" = "open";
                    "l" = "open";
                    "h" = "close_node";
                    "s" = "open_split";
                    "v" = "open_vsplit";
                    "a" = "add";
                    "d" = "delete";
                    "r" = "rename";
                    "c" = "copy_to_clipboard";
                    "m" = "cut_to_clipboard";
                    "p" = "paste_from_clipboard";
                    "H" = "toggle_hidden";
                    "R" = "refresh";
                };

                filesystem = {
                    hijack_netrw_behavior = "open_default";
                    use_libuv_file_watcher = true;
                    follow_current_file = {
                        enabled = true;
                        leave_dirs_open = false;
                    };
                    filtered_items = {
                        visible = false;
                        hide_dotfiles = false;
                        hide_gitignored = true;
                        never_show = [
                            ".git"
                            ".DS_Store"
                            "thumbs.db"
                            ".vscode"
                            "node_modules"
                            "__pycache__"
                            ".ipynb_checkpoints"
                        ];
                    };
                };
            };
        };
    };
}