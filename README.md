# [WIP] Git

Git log, git status and git changed source for [ido.nvim](https://github.com/ido-nvim/core)

Introduces the following ido packages:

| PKG_NAME   | purpose                              | default command       |
|------------|--------------------------------------|-----------------------|
| git-diff   | returns the files changed since HEAD | `git diff --name-only`|

### Installation

Install using your favorite package manager.

For example using packer.nvim:

```lua
use { 'ido-nvim/git' }
```

### Run

```vim
:lua require("ido").pkg.run(PKG_NAME, PKG_OPTS)
```

Where `PKG_NAME` is the package you wish to run.

### Configuration

The `ido-pkg/git.lua` module is loaded by default. This behavior can be overridden by setting `g:ido_pkg_git_loaded` to 1.

You have the option to specify the git command used per source.

For example, in order to overwrite the command used by the `git_diff` source:

```lua
require("ido").pkg.setup('git-diff', {
  pkg_opts = {
    -- overwrite the DIFF_COMMAND to return the changed files compared to master branch
    command = 'git diff master --name-only'
  }
})
```

Or to overwrite it just for a single run:

```lua
require("ido").pkg.run('git-diff', {
  -- overwrite the DIFF_COMMAND to return the changed files compared to master branch
  command = 'git diff master --name-only'
})
```

### Default Bindings

The following default bindings are provided:

| binding    | source |
|----------|---------|
| <leader>gd | git_diff |

These can be overwritten using the [bind option](https://github.com/ido-nvim/core/blob/main/wiki/packages.md#pkgbindname-opts)
