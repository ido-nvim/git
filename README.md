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

Before invoking/configuring the packages provided ensure `ido-nvim/git` has been registered with `ido.nvim` by requiring it:

```lua
require('ido-nvim/git')
```


### Run

```vim
:lua require("ido").pkg.run(PKG_NAME, PKG_OPTS)
```

Where `PKG_NAME` is the package you wish to run.



### Configuration

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


## Keybindings
```vim
:lua require("ido").pkg.setup(PKG_NAME, {{bind = KEY_BIND}})
```

where
- `PKG_NAME` is the package name
- `KEY_BIND` is the keybinding in standard vim notation `:h key-notation`

For more information refer to the [bind option](https://github.com/ido-nvim/core/blob/main/wiki/packages.md#pkgbindname-opts) documentation in the core repo.
