# Git
Contains git related narrowing functions for Ido.

Introduces the following modules:

| Name | Description | Keybinding |
| ---- | ----------- | ---------- |
| `diff` | Edit changed files | `<Leader>gd` |
| `files` | Edit git files | `<Leader>gf` |
| `log` | View the commit log, requires [`vim-fugitive`](https://github.com/tpope/vim-fugitive) | `<Leader>gl` |
| `status` | View the git status | `<Leader>gs` |

## Quick setup
- Install the plugin:

| Manager | Command |
| [`plug`](https://github.com/junegunn/vim-plug) | `Plug 'ido-nvim/git'` |
| [`vundle`](https://github.com/VundleVim/Vundle.vim) | `Plugin 'ido-nvim/git'` |
| [`dein`](https://github.com/Shougo/dein.vim) | `call dein#add('ido-nvim/git')` |
| [`minpac`](https://github.com/k-takata/minpac) | `call minpac#add('ido-nvim/git')` |
| [`packer`](https://github.com/wbthomason/packer.nvim) | `use 'ido-nvim/git'` |

Setup the package:

```lua
require("ido").setup{
   packages = {
      git = {}
   }
}
```

## Run
```vim
:lua require("ido").module.run("git/MODNAME")
```

where `MODNAME` is one of the four modules shown above

## Settings
The only setting (for now) in this package is `command`, which is executed to get the items

| Module | Default value |
| ------ | ------------- |
| `diff` | `"diff --name-only"` |
| `files` | `"ls-files"` |
| `log` | `"log --format='%h%d %s %cr'"` |
| `status` | `"status --short --untracked-files=all"` |

## Example configuration
```lua
require("ido").setup{
   packages = {

      -- Configure the `git` package
      git = {

         -- The `files` module configuration
         files = {

            -- Show modified files only
            settings = {
               command = "ls-files --modified"
            },

            -- The binding, like doing `noremap` in VimL
            binding = {

               -- Did you really think escaping from the Church of Emacs would
               -- cure that RSI? Think twice, young padawan!
               key = "<C-x>C-g><C-f>",

               -- mode = "insert" -- Make this an insert mode mapping if you dare
            }
         },

         -- The `status` module configuration
         status = {

            -- Change the prompt
            options = {
               prompt = "GStatus> "
            }
         }
      }
   }
}
```
