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

export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
