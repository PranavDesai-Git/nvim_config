local opt = vim.opt

opt.spell = false
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.timeoutlen = 300
opt.undofile = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.inccommand = "split"
opt.breakindent = true
opt.confirm = true
opt.mouse = "a"
opt.conceallevel = 2
opt.concealcursor = "nc"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous error" })
vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next error" })

-- Clear search highlights on pressing <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlights" })

-- Window navigation (Alt + h/j/k/l)
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Focus Left Window" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Focus Lower Window" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Focus Upper Window" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Focus Right Window" })

-- Buffer navigation (Shift + h/l)
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })

-- Quickly create a new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New File" })

-- Tab management
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "[t", "<cmd>tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "]t", "<cmd>tabnext<CR>", { desc = "Next Tab" })

vim.api.nvim_create_autocmd({ "VimResized", "FocusGained" }, {
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
            vim.diagnostic.enable()
        end
    end,
})

-- Silence vim.lsp.buf_get_clients deprecation warnings for legacy plugins
if vim.lsp.get_clients then
    vim.lsp.buf_get_clients = function(bufnr)
        return vim.lsp.get_clients({ bufnr = bufnr or 0 })
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "org",
    callback = function()
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = "nc"
    end,
})

vim.g.netrw_browsex_viewer = "thorium-browser"

local original_ui_open = vim.ui.open
vim.ui.open = function(path)
    local target = path
    if type(target) == "string" then
        local file_path = target:gsub("^file:", "")
        if vim.fn.filereadable(file_path) == 1 or vim.fn.isdirectory(file_path) == 1 then
            target = file_path
        end
    end

    if vim.fn.has("unix") == 1 and vim.fn.executable("xdg-open") == 1 then
        return vim.system({ "xdg-open", target }, { detach = true })
    end

    return original_ui_open(target)
end

-- Move selected lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })
