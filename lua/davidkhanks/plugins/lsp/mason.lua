local mason_status, mason = pcall(require, "mason")
if not mason_status then
    print("mason not installed")
    return
end

local mason_lspconfig_status, mason_lsp_config = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    print("mason-lspconfig not installed")
    return
end

mason.setup()

mason_lsp_config.setup({
    ensure_installed = {
        "tsserver",
        "html",
        "pylsp",
        "gopls",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
    }
})
