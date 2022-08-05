vim.cmd("packadd packer.nvim")

return require("packer").startup(function()
    use({ "wbthomason/packer.nvim", opt = true })

    local config = function(name)
        return string.format("require('plugins.%s')", name)
    end

    local use_with_config = function(path, name)
        use({ path, config = config(name) })
    end

    -- Grep through open files
    use_with_config("mileszs/ack.vim", "ack")

    -- Status line
    use_with_config('vim-airline/vim-airline', 'airline')
    use('vim-airline/vim-airline-themes')
    use('airblade/vim-gitgutter')
    use_with_config("lewis6991/gitsigns.nvim", "gitsigns")

    -- Colorschemes
    use('flazz/vim-colorschemes')
    use({
        'sonph/onehalf',
        rtp = 'vim',
    })
    use({
        "sainnhe/edge", -- themes with light and dark variants
        "sainnhe/gruvbox-material",
        "rmehri01/onenord.nvim",
        "folke/tokyonight.nvim",
        "rose-pine/neovim",
        "EdenEast/nightfox.nvim",
    })

    -- highlight color codes
    use({ "RRethy/vim-hexokinase", config = config("hexokinase"), run = "make hexokinase" })

    use('hoob3rt/lualine.nvim')
    use('kdheepak/tabline.nvim')

    -- Papal plugins
    use('tpope/vim-commentary')
    use('tpope/vim-eunuch')
    use('tpope/vim-fugitive')
    use('tpope/vim-surround')

    use('christoomey/vim-conflicted')
    use('jeffkreeftmeijer/vim-numbertoggle')
    use('ruanyl/vim-gh-line')
    use_with_config('mattn/vim-gist', 'gist')

    -- CSS
    use('stephenway/postcss.vim')
    use('hail2u/vim-css3-syntax')

    -- File browser symbols/icons
    use('ryanoasis/vim-devicons')

    -- JSDoc
    use({
        "heavenshell/vim-jsdoc",
        opt = true,
        ft = { "javascript", "javascript.jsx", "typescript" },
        config = config('jsdoc'),
        run = "make install",
    })

    -- JSON syntax support
    use({
        'elzr/vim-json',
        opt = true,
        ft = { 'json' },
    })

    -- NGINX syntax support
    use('vim-scripts/nginx.vim')

    -- GraphQL syntax support
    use('jparise/vim-graphql')
    
    -- Svelte syntax support
    use({
        'evanleck/vim-svelte',
        config = config('svelte'),
        branch = 'main',
    })

    -- Multi-language syntax support
    use('sheerun/vim-polyglot')

    -- Auto-formatting
    use({
        'prettier/vim-prettier',
        opt = true,
        ft = { 'javascript', 'css', 'less', 'scss', 'json', 'graphql' },
        config = config('prettier'),
        run = 'npm install',
    })

    -- TMUX
    use('christoomey/vim-tmux-navigator')

    -- Auto-completion and syntax support
    use("ggandor/lightspeed.nvim") -- motion
    use_with_config("dcampos/nvim-snippy", "snippy") -- snippets
    use({
        "hrsh7th/nvim-cmp", -- completion
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "dcampos/cmp-snippy",
            "hrsh7th/cmp-cmdline",
            "andersevenrud/cmp-tmux",
        },
        config = config("cmp"),
    })

    -- Fuzzy search
    use({
        'junegunn/fzf',
        config = config('fzf'),
        run = ":call fzf#install()",
    })
    use('junegunn/fzf.vim')
    use_with_config("ibhagwan/fzf-lua", "fzf") -- better lua version of fzf.vim

    -- LSP
    use('neovim/nvim-lspconfig')
    use("folke/lua-dev.nvim") -- better sumneko_lua settings
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({
                -- your configuration
            })
        end,
    })

    -- simple access to json-language-server schemae
    use('b0o/schemastore.nvim')

    use_with_config("RRethy/vim-illuminate", "illuminate") -- highlights and allows moving between variable references

    -- File browser
    use({
        'scrooloose/nerdtree',
        run = 'NERDTreeToggle',
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = config("treesitter"),
    })
    -- adds smart text objects
    use("RRethy/nvim-treesitter-textsubjects")
    use("windwp/nvim-ts-autotag") -- automatically close jsx tags
    use("JoosepAlviste/nvim-ts-context-commentstring") -- makes jsx comments actually work
    use_with_config("mizlan/iswap.nvim", "iswap") -- interactively swap function arguments

    -- Pop-up window shows possible key combinations as you type
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }

    -- JavaScript(ish) syntax support
    use({
        'pangloss/vim-javascript',
        ft = {'javascript', 'javascript.jsx'},
    })
    use({
        'leafgarland/typescript-vim',
        ft = {'typescript', 'typescript.tsx'},
    })
    use({
        'styled-components/vim-styled-components',
        branch = 'main',
        ft = {'javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'},
    })
    use({
        'peitalin/vim-jsx-typescript',
        ft = {'typescript.tsx'},
    })
    use('jose-elias-alvarez/null-ls.nvim')
    use('jose-elias-alvarez/typescript.nvim')

    use("nvim-lua/plenary.nvim")
end)
