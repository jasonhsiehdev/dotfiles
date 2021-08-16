## Installation Guide
- System - Linux
- Version - Ubuntu 16.04, i3 windows tiling
### Update and upgrade
```shell=
sudo apt-get update && sudo apt-get upgrade 
sudo apt-get install python-software-properties software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:jasonpleau/rofi
sudo add-apt-repository -y ppa:papirus/papirus
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
```

### Clone the dotfiles
```shell=
sudo apt-get install git tmux
git clone https://github.com/jasonhsiehdev/dotfiles
```


### Install fish
```shell=
sudo apt-get install fish
git clone https://github.com/oh-my-fish/oh-my-fish
cd oh-my-fish
bin/install
omf install bass tab z
```


### Install package for Yocto
```shell=
sudo apt-get install libncurses5-dev libncursesw5-dev libx11-dev libperl-dev ctags exuberant-ctags 
sudo apt-get install cscope wget git make curl chrpath gawk corkscrew texinfo libsdl1.2-dev libsdl1.2-dev 
sudo apt-get install diffstat ninja-build libc6 libncurses5 libstdc++6 libz1 cpio
```

### Install package for i3wm
```shell=
sudo apt-get install i3 thunar fonts-font-awesome gnome-icon-theme feh
sudo apt-get install lxappearance compton scrot cargo
```

### Install package for i3status-rust
```shell=
git clone https://github.com/greshake/i3status-rust
sudo apt-get install pkg-config libssl-dev libdbus-1-dev
```

### Update rust
```shell=
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --path .
./install.sh
### Another package
git clone https://github.com/haikarainen/light.git
sudo apt-get install autoconf automake 
./autogen.sh 
./configure
make -j4 
sudo make install
```

### Install rofi and theme
```shell=
git clone --depth=1 https://github.com/adi1090x/rofi.git
./setup.sh
sudo apt-get install papirus-icon-theme
rofi-theme-selecto
```

### Install neovim
```shell=
sudo apt-get install neovim
```

## Install cmake 3.18
```shell=
wget https://cmake.org/files/v3.18/cmake-3.18.4-Linux-x86_64.tar.gz
tar -xzvf cmake-3.18.4-Linux-x86_64.tar.gz \ 
sudo cp cmake-3.18.4-Linux-x86_64/bin/*  /usr/bin/
sudo mkdir /usr/share/cmake-3.18
cp -rf cmake-3.18.4-Linux-x86_64/share/cmake-3.18 /usr/share/cmake-3.18/
sudo apt-get install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```

### Install gcc-8, g++-8 and python3.6 for YCM
```shell=
sudo apt-get install python3.6 python3.6-dev python3-pip gcc-8 g++-8 python3.6-gdbm
pip3 install neovim 
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 0 
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 0 
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1 
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 1 
sudo update-alternatives --set gcc /usr/bin/gcc-8 
sudo update-alternatives --set g++ /usr/bin/g++-8 
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 0
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
sudo update-alternatives --set python3 /usr/bin/python3.6

cd /usr/lib/python3/dist-packages/
sudo cp apt_pkg.cpython-35m-x86_64-linux-gnu.so apt_pkg.cpython-36m-x86_64-linux-gnu.so
cd /usr/lib/python3/dist-packages/gi/
sudo cp _gi.cpython-35m-x86_64-linux-gnu.so _gi.cpython-36m-x86_64-linux-gnu.so
sudo cp _gi_cairo.cpython-35m-x86_64-linux-gnu.so _gi_cairo.cpython-36m-x86_64-linux-gnu.so

nvim .
PlugInstall
```

### Install font
```shell=
0. sudo apt-get install fonts-powerline
1. Download font awesome at https://github.com/FortAwesome/Font-Awesome/releases/tag/5.15.4
2. Double click the otf file
3. Click install
4. Done
5. Download 
```


### Create hard link for configuration files.
```shell=
ln tmux.conf ~/.tmux.conf -f 
ln config ~/.config/i3/config -f 
ln init.vim ~/.config/nvim/init.vim -f 
ln config.fish ~/.config/fish/config.fish -f
ln config.toml ~/.local/share/i3status-rust/config.toml -f
```

### Install chewing
```shell=
sudo apt-get install fcitx fcitx-chewing
```

