#!/usr/bin/env fish

# set path
set PATH /usr/local/opt/coreutils /Users/semio/bin/ /usr/local/bin /usr/local/sbin $PATH

set PKG_CONFIG_PATH /usr/local/lib/pkgconfig /opt/X11/lib/pkgconfig

# Android
set PATH "$HOME/Library/Android/sdk/platform-tools" "$HOME/Library/Android/sdk/platform-tools" $PATH

# python
set PATH /Users/semio/.pyenv/shims/ $PATH
set PYTHONPATH "$HOME/src/astrology/"

# rust
set RUST_SRC_PATH "$HOME/src/rust/libs/rust/src"

# others
set LIBRARY_PATH "/usr/local/lib"
set LD_LIBRARY_PATH "$HOME/src/lua/torch/install/lib" "/usr/lib"
set DYLD_LIBRARY_PATH $LD_LIBRARY

set GOPATH "$HOME/src/go"
set NODE_PATH "/Users/semio/node_modules"

# github
set HOMEBREW_GITHUB_API_TOKEN '87b2038096ff45351543c85c076fcd9b5b4e3ba0'
alias git=hub

# command alias
alias th='luajit -ltorch'
alias ss='ssh -D 1070'

# don't use rm
alias rm='rmtrash'

# Prefer US English and use UTF-8
# Comment below 2 lines to solve sed problem
set -x LC_ALL "en_US.UTF-8"
set -x LANG "en_US"
set -x LC_CTYPE "C"


