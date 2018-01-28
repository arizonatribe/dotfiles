# dotfiles
Configuration files for Vim, Tmux, Bash, and others

## Dependencies

The `.bash_aliases` and `.vimrc` refer to a couple of tools that need to be installed manually:

```bash
apt-get install -y \
  && python-pygments \
  && silversearcher-ag \
  && git \
  && build-essential \
  && ncurses-dev
```

OR

```bash
yum install -y \
  && python-pygments \
  && the_silver_searcher \
  && git \
  && make \
  && gcc \
  && kernel-devel \
  && ncurses-devel

```

Docker and Docker-Compose need to be installed too. Follow the instructions for installing the [Docker Engine](https://docs.docker.com/engine/installation/) and [Docker Compose](https://docs.docker.com/compose/install/).

Tmux also needs to be installed, however some of the plugins used in the `.tmux.conf` require a minimum of version 2.1 of tmux (which may not be the version installed in a normal `yum/apt-get install tmux`. Therefore reference these instructions for manually installing the correct version (along with necessary dependencies of which some are undoubtedly installed already on your machine):

```bash
# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
curl -OL https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz \
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

## Vim Instructions

This configuration file sets up plugins and you need setup the plugin manager. Several installation steps will happen automatically, you just need to open vim to trigger the steps:

1. Open vim `vim`, and if prompted to hit enter, do so (this first step is creating missing directories and setting up the plugin manager)
2. Now that vim is open and the plugin manager installed, enter the vim command `:PlugInstall` and hit enter (this process may take a minute to install all the plugins)
3. After closing vim, you can re-open one last time (this final step will pull the color scheme files into the `~/.vim/colors/` directory

