local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use({"wbthomason/packer.nvim", commit = "ea0cc3c"})

    -- a bunch of lua functions that a lot of plugins use
    use({"nvim-lua/plenary.nvim", commit = "9ce85b0"})

    -- Theme(s)
    use("bluz71/vim-nightfly-guicolors")
    use({"navarasu/onedark.nvim", commit = "826fb77"})

    -- use Ctrl + hjkl to navigate windows
    use({"christoomey/vim-tmux-navigator", commit = "7db70e0"})

    -- maximize toggle current vim window
    use({"szw/vim-maximizer", commit = "2e54952"})

    -- surround chars
    use({"tpope/vim-surround", commit = "3d188ed"})

    use({"kylechui/nvim-surround", commit = "1c2ef59"})

    -- replace text from register
    use({"vim-scripts/ReplaceWithRegister", commit = "832efc2"})

    -- Commenting with gc
    use({"numToStr/Comment.nvim", commit = "0236521"})

    -- File Explorer
    use({"nvim-tree/nvim-tree.lua", commit = "914a686"})

    -- Nice Icons
    use({"kyazdani42/nvim-web-devicons", commit = "b844d3d"})

    -- Status line
    use({"nvim-lualine/lualine.nvim", commit = "45e27ca"})

    -- Toggles opposite values ie true -> false
    use({'nguyenvukhang/nvim-toggler', commit = "c10828c"})

    -- Dressing up inputs
    use ({'stevearc/dressing.nvim', commit = "c1e1d5f"})

    -- Fuzzy finding
    use({ "nvim-telescope/telescope-fzf-native.nvim", commit = "6c921ca", run = "make" })
    use({ "nvim-telescope/telescope.nvim", commit = "54930e1", branch = "0.1.x" })

    -- autocompletion
    use({"hrsh7th/nvim-cmp", commit = "5dce1b7"})
    use({"hrsh7th/cmp-buffer", commit = "3022dbc"})
    use({"hrsh7th/cmp-path", commit = "91ff86c"})

    -- snippets
    use({"L3MON4D3/LuaSnip", commit = "c5fb16a"})
    use({"saadparwaiz1/cmp_luasnip", commit = "1809552"})
    use({"rafamadriz/friendly-snippets", commit = "ebf6d6e"})

    -- Managing and installing lsp servers
    use({"williamboman/mason.nvim", commit = "d66c60e"})
    use({"williamboman/mason-lspconfig.nvim", commit = "2451adb"})

    -- configuring lsp servers
    use({"neovim/nvim-lspconfig", commit = "ede4114"})
    use({"hrsh7th/cmp-nvim-lsp", commit = "44b16d1"})

    use({"onsails/lspkind.nvim", commit = "57610d5"})

    -- lsp-zero to make lsp easy
    use {
        'VonHeikemen/lsp-zero.nvim',
        commit = "abd2208",
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig", commit = "ede4114"},             -- Required
            {"williamboman/mason.nvim", commit = "d66c60e"},           -- Optional
            {"williamboman/mason-lspconfig.nvim", commit = "2451adb"}, -- Optional

            -- Autocompletion
            {"hrsh7th/nvim-cmp", commit = "5dce1b7"},         -- Required
            {"hrsh7th/cmp-buffer", commit = "3022dbc"},       -- Required
            {"hrsh7th/cmp-path", commit = "91ff86c"},         -- Optional
            {"saadparwaiz1/cmp_luasnip", commit = "1809552"}, -- Optional
            {"hrsh7th/cmp-nvim-lsp", commit = "44b16d1"},     -- Required
            {"hrsh7th/cmp-nvim-lua", commit = "f12408b"},     -- Required

            -- Snippets
            {"L3MON4D3/LuaSnip", commit = "c5fb16a"},              -- Required
            {"rafamadriz/friendly-snippets", commit = "ebf6d6e"},  -- Required
        }
    }

    use({'theprimeagen/harpoon', commit = "21f4c47"})

    -- Keep track of undos
    use({'mbbill/undotree', commit = "0e11ba7"})

    -- Git utility
    use({'tpope/vim-fugitive', commit = "99db68d"})

    -- Git side bar markers
    use({'lewis6991/gitsigns.nvim', commit = "f0e9f5d"})

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        commit = "fc93fa5",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })

    -- auto-closing
    use({"windwp/nvim-autopairs", commit = "7b3eb9b"})
    use({"windwp/nvim-ts-autotag", commit = "6be1192"})

    use({'karb94/neoscroll.nvim', commit = "4bc0212"})


    if packer_bootstrap then
        require("packer").sync()
    end
end)
