# ido-git

Several sources for varying git commands

### Installation

Install using your favorite package manager.

For example using packer.nvim:

```lua
use { 'ido-nvim/ido-git', configure = function() require 'ido-pkg/git_diff' end }
```

### Configuration

The `ido-pkg/git.lua` module is not loaded by default.
This is done to provide maximum extensibility. As such one is required to `require` the module
somewhere in your vim configuration.

As a result the command used to populate the items for each source can be customized by overwriting
the corresponding constant on the module.

For example, in order to overwrite the command used by the `git_diff` source:

```lua
-- register the git package with IDO
local ido_git = require('ido-pkg/git')

-- overwrite the DIFF_COMMAND to return the changed files compared to master branch
ido_git.DIFF_COMMAND = 'git diff master --name-only'
```

### Sources

ido-git comes with several default sources:


| source   | purpose |
|----------|---------|
| git-diff | returns the files changed since HEAD |

### Default Bindings


| binding    | source |
|----------|---------|
| <leader>gd | git_diff |
