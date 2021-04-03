local package = require("ido.package")

package.new{
   name = "git",

   modules = {
      "diff",
      "status",
      "log",
      "files"
   }
}
