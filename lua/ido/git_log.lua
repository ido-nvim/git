local common = require("ido.git_common")
local ido = require("ido")

local log = {}

log.settings = {
   command = "log --format='%h%d %s %cr'"
}

log.binding = {
   key = "<Leader>gl"
}

function log.main(pkg_opts)
   if not common.ensure(
      vim.fn.exists("*FugitiveFind") == 1,
      "Dependency: vim-fugitive not installed") then

      return
   end

   common.main(log.settings.command, "log", function (commit)
      commit = commit:gsub(" .*", "")
      vim.cmd("edit "..vim.fn.FugitiveFind(commit))
   end)
end

return log
