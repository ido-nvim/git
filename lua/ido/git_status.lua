local common = require("ido.git_common")
local ido = require("ido")

local status = {}

status.settings = {
   command = "status --short --untracked-files=all"
}

status.binding = {
   key = "<Leader>gs"
}

function status.main(pkg_opts)
   common.main(status.settings.command, "status", function (file)
      file = file:gsub("^[^ ]* ", "")

      if common.exists(file) then
         vim.cmd("edit "..file)
      end
   end)
end

return status
