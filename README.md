# dotfiles

Configuration files for Vim, Tmux, Bash, and others

## Grep

For Vim/Neovim to work properly on grep (searching), two plugins are needed:

```
sudo dnf install -y the_silver_searcher ripgrep bash-completion
```
 
## Rust

Rust (and tmux) has a few dependencies which may or may not already be present on the machine (adjust accordingly).

- cmake
- gcc
- clang
- make

```
sudo dnf install \
  cmake \
  ncurses-devel \
  gcc \
  clang \
  make
```

After the dependencies have been installed you can install Rust:

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## TMUX

Some of the plugins used in the `.tmux.conf` require a minimum of version 2.1 of tmux (which may not be the version installed in a normal `yum/apt-get/dnf install tmux`. Therefore reference these instructions for manually installing the correct version (along with necessary dependencies of which some are undoubtedly installed already on your machine):

```bash
# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
curl -OL https://sourceforge.net/projects/levent/files/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz \
  && tar -xvzf libevent-2.0.22-stable.tar.gz \
  && cd libevent-2.0.22-stable \
  && ./configure --prefix=/usr/local \
  && make \
  && sudo make install

# DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL
curl -OL https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz \
  && tar -xvzf tmux-2.6.tar.gz \
  && cd tmux-2.6 \
  && LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local \
  && make \
  && sudo make install
```

## NodeJs

The best way to install NodeJs is using the Node Version Manager (NVM), which allows switching between versions of Node.

Run the install script (bash):

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

Next, update the `~/.bashrc`:

```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

Now you can install any version of NodeJs, such as:

```
nvm install v16.0.0
```

### Yarn

The [yarn](https://yarnpkg.com/getting-started/install) package manager is used by several underlying plugins and it can be install globally as an NPM package.

```
npm install --global yarn
```

### Global NPM packages

Several NPM packages are useful for both the IDE and miscellaneous administrative tasks on the machine:

* [nx](https://www.npmjs.com/package/nx) - Multi-package (monorepo) management (mainly) for JavaScript/TypeScript projects
* [eslint](https://www.npmjs.com/package/eslint) - Static analysis of JavaScript/TypeScript files
* [prettier](https://www.npmjs.com/package/prettier) - Auto formatting of code
* [fkill](https://www.npmjs.com/package/fkill-cli) - Easily search and kill processes on the machine
* [vtop](https://www.npmjs.com/package/vtop) - Process metrics on CPU and memory usage on the machine
* [emoj](https://www.npmjs.com/package/emoj) - To search for emojis and copy them to the clipboard

```
yarn global add \
  nx \
  eslint \
  prettier \
  fkill-cli \
  vtop \
  emoj
```

## Golang

Go (version number may differ)

```bash
curl -OL https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
tar -xzf go1.17.7.linux-amd64.tar.gz -C /usr/local
```

## Language Servers

Several language servers can be installed via [yarn](https://yarnpkg.com/getting-started/install)

* [typescript](https://www.npmjs.com/package/typescript)
* [typescript](https://www.npmjs.com/package/typescript-language-server)
* [flow](https://www.npmjs.com/package/flow-bin)
* [pyright](https://www.npmjs.com/package/pyrigh) - A language server for Python

```
yarn global add \
  flow-bin \
  typescript \
  typescript-language-server \
  pyright
```

For setting up Rust's language server:

```bash
mkdir -p ~/.local/bin
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
```

And for setting up Golang's language server:

```
$ go install golang.org/x/tools/gopls@latest
```

### Configure Language Servers

Configure the Language servers by importing this from the `$HOME/.config/nvim/init.lua`

```
require'lspconfig'.tsserver.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}
```

## Install Neovim

Neovim can be installed directly from the [Github releases](https://github.com/neovim/neovim/releases) page or via a package manager. For example, on Fedora linux:

```
dnf install neovim
```

Optionally, the AppImage can be downloaded and installed from the Github releases.

## Vim Instructions

This configuration file sets up plugins and you need setup the plugin manager. Several installation steps will happen automatically, you just need to open vim to trigger the steps:

1. Open neovim/vim via the `nvim` command.
2. Enter the vim command `:UpdateRemotePlugins` and hit enter
3. Next, enter the vim command `:PlugInstall` and hit enter (this process may take a minute to install all the plugins)

## TODO

* Install Java 8+
* Install Python 3.8+ - Probably not needed for Mac/Linux since already installed.
