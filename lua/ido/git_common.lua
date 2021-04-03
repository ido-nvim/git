local ido = require("ido")
local common = {}

-- Check if the path exists
-- @return true or false
function common.exists(path)
   return io.open(path, "r") and true or false
end

-- Check if the current directory is a git repo
-- @return true or false
function common.ensure(condition, message)
   if not condition then
      vim.cmd("echohl ErrorMsg")

      message = message:gsub("'", "''")
      vim.cmd("echo '"..message.."'")

      vim.cmd("echohl Normal")
      return nil
   end

   return true
end

-- Common entry point to Ido
-- @param command string The command to execute
-- @param prompt string The prompt
-- @param action function The action to perform
function common.main(command, prompt, action)
   if not common.ensure(
      os.execute("git rev-parse --is-inside-work-tree") == 0,
      "Git: not a repo") then

      return
   end

   local selected = ido.start({
      items = vim.fn.systemlist("git "..command),
      prompt = "Git "..prompt..": ",
   })

   if #selected > 0 then
      action(selected)
   end

   return ""
end

return common
