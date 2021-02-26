if exists("g:ido_pkg_git")
  finish
endif

lua require 'ido-pkg/git_diff'

let g:ido_pkg_git = 1
