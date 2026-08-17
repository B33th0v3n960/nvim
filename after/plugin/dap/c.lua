local dap = require("dap")

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = {
    "--interpreter=dap",

    "--eval-command",
    "set print pretty on",

    "--eval-command",
    "handle SIGABRT nostop noprint pass",

    "--eval-command",
    "handle SIGSEGV nostop noprint pass",
  },
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = {},
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
