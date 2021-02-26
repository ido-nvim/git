local vim = vim or {}
local pkg = require("ido").pkg

-- Determine if location exists
local function exists(path)
  return io.open(path, "r") and true or false
end

local function check_git()
  -- Check if the current directory is a git repo
   if os.execute("git rev-parse --is-inside-work-tree 2>/dev/null") ~= 0 then
      vim.cmd("echohl ErrorMsg | echo 'Not a git repository!' | echohl Normal")
      return ""
   end
end

local module = {}

-- GIT DIFF {{{
module.DIFF_COMMAND = 'git diff --name-only'

module.diff = function()
  check_git()

  local file = pkg.start({
    items = vim.fn.systemlist(module.DIFF_COMMAND),
    prompt = "Git diff: ",
  })

  if #file > 0 and exists(file) then
    vim.cmd("edit "..file)
  end

  return ""
end

-- Setup the package
pkg.new("git_diff", {
   main = module.diff,
   bind = {
      -- Bind it to <Leader>gf
      key = "<Leader>gd",
      mode = "n",
      noremap = true,
      silent = true,
      buffer = false,
   },
})
--}}}


return module
-- vim: foldmethod=marker:sw=2:foldlevel=10
