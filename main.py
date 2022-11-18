#!/usr/bin/env python
configs = {
    "nvim": {
        "explanation": "config files required for my NeoVim config",
        "remove": ["~/.config/nvim"],
        "create_dirs": ["~/.config/nvim"],
        "commands_before": ["git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1"],
        "target_files": [(".config/nvim/custom", "~/.config/nvim/lua/custom")],
        "commands_after": ["nvim"],
    },
    "fish": {
        "explanation": "config files required for my fish config",
        "install": {},
        "remove": ["~/.config/fish"],
        "create_dirs": ["~/.config/fish"],
        "commands_before": [],
        "target_files": [(".config/fish", "~/.config/fish")],
        "commands_after": [],
    },
}
