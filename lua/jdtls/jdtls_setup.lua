local M = {}

function M:setup()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = vim.fn.stdpath("data") ..
      package.config:sub(1, 1) .. "jdtls-workspace" .. package.config:sub(1, 1) .. project_name

  local config = {
    name = "jdtls",
    cmd = {
      "jdtls",
      "-data",
      workspace_dir,
    },

    root_dir = vim.fs.root(0, { "pom.xml", "gradlew", ".git", "mvnw", }),

    settings = {
      java = {}
    },

    init_options = {
      bundles = {}
    },
  }
  require("jdtls").start_or_attach(config)
end

return M
