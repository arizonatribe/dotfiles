local api = vim.api

local add_hlgroup = function(text, hlgroup)
    return string.format("%%#%s#%s%%*", hlgroup, text)
end

_G.tabline = function()
    local current = api.nvim_get_current_tabpage()

    local tabline = {}
    for i, tabpage in ipairs(api.nvim_list_tabpages()) do
        local label = { " ", i, ": " }

        local bufnr = api.nvim_win_get_buf(api.nvim_tabpage_get_win(tabpage))
        local bufname = api.nvim_buf_get_name(bufnr)
        local buf_label = bufname == "" and "[No Name]" or vim.fn.fnamemodify(bufname, ":t")
        if buf_label:find("lazygit") then
            buf_label = "lazygit"
        end
        table.insert(label, buf_label)

        local hlgroup = tabpage == current and "TabLineSel" or "TabLine"
        table.insert(label, " ")
        table.insert(tabline, add_hlgroup(table.concat(label), hlgroup))
    end

    return table.concat(tabline)
end

vim.opt.tabline = [[%!luaeval('tabline()')]]
