require'nvim-web-devicons'.setup {
    -- Override specific icons with custom settings
    -- Define personalized icons, colors, and terminal colors here
    -- Icons specified here will replace defaults with your choices
    override = {
        zsh = {
            icon = "",             -- Icon for zsh files
            color = "#428850",       -- Hex color for the zsh icon
            cterm_color = "65",      -- Terminal color code for the zsh icon
            name = "Zsh"             -- Icon name used for zsh files
        }
    },

    -- Color Configuration
    color_icons = true,              -- Enable unique colors per icon (default true)

    -- Default Icon Configuration
    default = true,                  -- Enable default icons for files without specific icons

    -- Strict Selection Mode
    strict = true,                   -- Enable strict selection of icons based on filename and extension

    -- Filename Overrides
    -- Assign specific icons to filenames regardless of extension
    -- Useful for files like .gitignore where a unique icon is desired
    override_by_filename = {
        [".gitignore"] = {
            icon = "",             -- Icon for .gitignore files
            color = "#f1502f",       -- Hex color for the gitignore icon
            name = "Gitignore"       -- Name used for .gitignore icon
        }
    },

    -- Extension Overrides
    -- Assign specific icons to files based on their extension
    override_by_extension = {
        ["log"] = {
            icon = "",             -- Icon for .log files
            color = "#81e043",       -- Hex color for log files
            name = "Log"             -- Icon name used for .log files
        }
    },

    -- Operating System Overrides
    -- Assign specific icons based on operating system, if desired
    override_by_operating_system = {
        ["apple"] = {
            icon = "",             -- Icon for Apple operating system files
            color = "#A2AAAD",       -- Hex color for Apple files
            cterm_color = "248",     -- Terminal color code for Apple icon
            name = "Apple"           -- Name used for Apple icon
        }
    }
}
