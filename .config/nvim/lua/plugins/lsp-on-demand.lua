local servers = {
  "vtsls",
  "eslint",
  "jsonls",
  "yamlls",
  "dockerls",
  "docker_compose_language_service",
  "lua_ls",
  "marksman",
}

local function enable_lsp(enabled)
  for _, server in ipairs(servers) do
    pcall(vim.lsp.enable, server, enabled)
  end

  if not enabled then
    vim.lsp.stop_client(vim.lsp.get_clients(), true)
  end
end

local function lsp_status()
  local all_clients = vim.lsp.get_clients()
  local buffer_clients = vim.lsp.get_clients({ bufnr = 0 })

  print("Active LSP clients: " .. #all_clients)
  print("Current buffer LSP clients: " .. #buffer_clients)

  if #buffer_clients > 0 then
    print("Current buffer:")
    for _, client in ipairs(buffer_clients) do
      print("- " .. client.name)
    end
  end

  if #all_clients > 0 then
    print("All active:")
    for _, client in ipairs(all_clients) do
      print("- " .. client.name)
    end
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.setup = opts.setup or {}

      local previous_setup = opts.setup["*"]

      opts.setup["*"] = function(server, server_opts)
        if previous_setup and previous_setup(server, server_opts) then
          return true
        end

        vim.lsp.config(server, server_opts)

        -- Configure servers, but leave startup under manual control with :Lon.
        return true
      end
    end,
    init = function()
      vim.api.nvim_create_user_command("Lon", function()
        enable_lsp(true)
        vim.cmd("edit")
        print("LSP enabled")
      end, {})

      vim.api.nvim_create_user_command("Lof", function()
        enable_lsp(false)
        print("LSP disabled")
      end, {})

      vim.api.nvim_create_user_command("Lst", function()
        lsp_status()
      end, {})
    end,
  },
}
