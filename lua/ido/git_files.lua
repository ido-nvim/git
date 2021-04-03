local common = require("ido.git_common")
local ido = require("ido")

local files = {}

files.settings = {
   command = "ls-files"
}

files.binding = {
   key = "<Leader>gf"
}

function files.main(pkg_opts)
   common.main(files.settings.command, "files", function (file)
      if common.exists(file) then
         vim.cmd("edit "..file)
      end
   end)
end

return files
