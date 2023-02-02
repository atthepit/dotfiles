local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua'
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- This mappins only apply on completition help
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- Previous element
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- Next element
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Select element
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings -- Apply completion mappins
})

local builtin = require('telescope.builtin')

-- This function runs every time LSP connects to a particular buffer
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, opts) -- '[R]e[n]ame'
    vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, opts) -- '[C]ode [A]ction'

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
    vim.keymap.set("n", "gr", builtin.lsp_references, opts) -- [G]oto [R]eferences
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts) -- [G]oto [I]mplementation

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- See hover documentation
    vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts) -- Signature documentation
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", '<leader>D', vim.lsp.buf.type_definition, opts) -- 'Type [D]efinition'
    vim.keymap.set("n", '<leader>ws', builtin.lsp_dynamic_workspace_symbols, opts) -- '[W]orkspace [S]ymbols'
    vim.keymap.set("n", '<leader>ds', builtin.lsp_document_symbols, opts) -- '[D]ocument [S]ymbols'

    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts) -- don't know what diagnostics are...
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format) -- Format file
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

