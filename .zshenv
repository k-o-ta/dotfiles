export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.cargo/bin/racer"

export DYLD_LIBRARY_PATH="$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib"
export LD_LIBRARY_PATH="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib"

export PATH="$PATH:$HOME/development/scripts/target/release"

export PATH="$PATH:$HOME/rtags/bin"

export GOPATH=$HOME/development/go
export PATH=$PATH:$GOPATH/bin

# macのシステムワイドのrbenvが使われてしまうので.zshenvで読込している
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="$PATH:$HOME/my-application/cli"
