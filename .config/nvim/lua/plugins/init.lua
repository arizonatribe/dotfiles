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

    -- Colorschemes
    use('flazz/vim-colorschemes')
    use({
        'sonph/onehalf',
        rtp = 'vim',
    })

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

    -- File browser
    -- use('scrooloose/nerdtree')
    use({
        'scrooloose/nerdtree',
        run = 'NERDTreeToggle',
    })

    -- Auto-completion and syntax support
    -- use({
    --     'neoclide/coc.nvim',
    --     config = config('coc'),
    --     branch = 'release',
    -- })

    -- Fuzzy search
    use({
        'junegunn/fzf',
        config = config('fzf'),
        run = ":call fzf#install()",
    })
    use('junegunn/fzf.vim')

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

    -- LSP
    use('neovim/nvim-lspconfig')
end)
