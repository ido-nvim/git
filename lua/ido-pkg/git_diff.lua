local vim = vim or {}
local pkg = require("ido").pkg

local COMMAND = 'git diff --name-only'

-- Determine if location exists
local function exists(path)
  return io.open(path, "r") and true or false
end

-- Fuzzy find git diff HEAD
local function git_changed_files()
  -- Check if the current directory is a git repo
   if os.execute("git rev-parse --is-inside-work-tree 2>/dev/null") ~= 0 then
      vim.cmd("echohl ErrorMsg | echo 'Not a git repository!' | echohl Normal")
      return ""
   end

   local file = pkg.start({
      items = vim.fn.systemlist(COMMAND),
      prompt = "Git diff: ",
   })

   if #file > 0 and exists(file) then
      vim.cmd("edit "..file)
   end

   return ""
end

-- Setup the package
pkg.new("git_diff", {
   main = git_changed_files,
   bind = {
      -- Bind it to <Leader>gf
      key = "<Leader>gd",
      mode = "n",
      noremap = true,
      silent = true,
      buffer = false,
   },
})
