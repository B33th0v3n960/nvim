local M = {}

function M:setup()
  local sep = package.config:sub(1, 1)
  local mason = vim.fn.stdpath("data") .. sep .. "mason" .. sep .. "packages"

  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = vim.fn.stdpath("data") .. sep .. "jdtls-workspace" .. sep .. project_name

  -- Debug (and optional test) bundles
  local bundles = {}
  local debug_jar =
    vim.fn.glob(mason .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
  if debug_jar ~= "" then
    table.insert(bundles, debug_jar)
  end
  -- Optional: only if you installed java-test
  local test_jars = vim.fn.glob(mason .. "/java-test/extension/server/*.jar", true)
  if test_jars ~= "" then
    vim.list_extend(bundles, vim.split(test_jars, "\n"))
  end

  local config = {
    name = "jdtls",
    cmd = { "jdtls", "-data", workspace_dir },
    root_dir = vim.fs.root(0, { "pom.xml", "gradlew", ".git", "mvnw" }),

    settings = {
      java = {},
    },

    init_options = {
      bundles = bundles,
    },

    on_attach = function(client, bufnr)
      require("jdtls").setup_dap({ hotcodereplace = "auto" })
      require("jdtls.dap").setup_dap_main_class_configs()
    end,
  }

  require("jdtls").start_or_attach(config)
end

return M
