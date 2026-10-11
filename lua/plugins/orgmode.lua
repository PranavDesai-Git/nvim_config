return {
    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { "org" },
        config = function()
            require("orgmode").setup({
                org_agenda_files = "~/org/**/*",
                org_default_notes_file = "~/org/notes.org",
                mappings = {
                    org = {
                        org_toggle_checkbox = "~",
                    },
                },
            })
        end,
    },
}
