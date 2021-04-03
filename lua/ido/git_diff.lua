local common = require("ido.git_common")
local ido = require("ido")

local diff = {}

diff.settings = {
   command = "diff --name-only"
}

diff.binding = {
   key = "<Leader>gd"
}

function diff.main(pkg_opts)
   common.main(diff.settings.command, "diff", function (file)
      if common.exists(file) then
         vim.cmd("edit "..file)
      end
   end)
end

return diff
