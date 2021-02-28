if exists("g:ido_pkg_git_loaded") | finish | endif

lua require("ido-pkg/git")

let g:ido_pkg_git_loaded = 1
