#!/usr/bin/env bash

#########  HELPER  #########

echo_with_date() {
  echo "[`date '+%H:%M:%S'`]" $1
}



#########  BASIC  #########

install_brew() {
  # brew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # brew cask
  brew tap homebrew/cask
  brew tap homebrew/cask-fonts
  brew tap homebrew/cask-versions
}

check_brew() {

  # Check for Homebrew, install bew if we don't have it
  if test ! $(which brew); then
    echo "Installing homebrew..."
    install_brew
  fi

  # brew doctor
  brew doctor

  # cleanup
  brew cleanup
}



#########  APPLICATION  #########

# Common Productivity App
    # drawio \
    # dozer \
brew_install_productivity_app() {

  brew install --cask google-chrome
  brew install --cask google-chrome-canary
  brew install --cask pdf-expert
  brew install --cask vlc
  brew install --cask whatsapp
}

# Common Utility App
    # aerial \
    # alfred \
    # fantastical \
    # monosnap \
    # zoomus \
brew_install_utility_app() {

  brew install --cask caffeine
  brew install --cask ccleaner
  brew install --cask cheatsheet
  brew install --cask istat-menus
  brew install --cask keka
  brew install --cask proxifier
  brew install --cask 1password
  brew install --cask cakebrew

}

# Quick Look plugins
brew_install_quicklook_plugins() {

  brew install --cask qlcolorcode
  brew install --cask qlstephen
  brew install --cask qlmarkdown
  brew install --cask quicklook-json
  brew install --cask qlprettypatch
  brew install --cask quicklook-csv
  brew install --cask webpquicklook
  brew install --cask suspicious-package
}

# Common Development App
    # intellij-idea-ce \
    # meld \
    # sourcetree \
    # sublime-text \
    # virtualbox \
brew_install_development_app() {

  brew install --cask anaconda
  brew install --cask authy
  brew install --cask docker
  brew install --cask iterm2
  brew install --cask keepassxc
  brew install --cask mysql-shell
  brew install --cask github
  brew install --cask atom
  brew install --cask visual-studio-code
  brew install node
}

# Command Line Toolkit
brew_install_commandline_toolkit() {

  brew install aria2
  brew install awscli
  brew install bat
  brew install coreutils
  brew install curl
  brew install findutils
  brew install fzf
  brew install gawk
  brew install git-lfs
  brew install glances
  brew install gnutls
  brew install gnu-getopt
  brew install gnu-indent
  brew install gnu-tar
  brew install gnu-sed
  brew install htop
  brew install imagemagick
  brew install jq
  brew install lrzsz
  brew install mas
  brew install moreutils
  brew install openssh
  brew install screen
  brew install shellcheck
  brew install the_silver_searcher
  brew install tmux
  brew install tree
  brew install tmux
  brew install wget
  brew install xclip
  brew install you-get
  brew install youtube-dl
  # xcode-select --install
}



#########  MACUP  #########

clone_macup() {
  git clone --recursive https://github.com/robikus/macup.git ~/.macup
}



#########  ALIAS  #########

config_alias() {

  # backup alias
  mv -rf ~/.alias ~/.alias_bk_`date +%Y-%m-%d`

  ln -s ~/.macup/dotfile/alias ~/.alias
}



#########  GIT  #########

config_git() {

  git config --global user.name "robikus"
  git config --global user.email polakovic.robert.git@gmail.com
  git config --global core.editor vim
  git config --global credential.helper cache
  git config --global credential.helper 'cache --timeout=3600'
}



#########  ITERMS2  #########

config_iterm2() {

  # add Solarized Dark theme

  # add powerline font
  brew install --cask font-meslo-for-powerline

  # add powerlevel9k
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
}



#########  TMUX  #########

config_tmux () {

  # backup tmux
  mv ~/.tmux.conf ~/.tmux.conf_bk_`date +%Y-%m-%d`

  ln -s ~/macup/dotfile/tmux.conf ~/.tmux.conf
}



#########  VIM  #########

config_vim () {

  # backup vim
  mv ~/.vimrc ~/.vimrc_bk_`date +%Y-%m-%d`

  ln -s ~/macup/dotfile/vimrc ~/.vimrc
}



#########  ZSH  #########

install_zsh() {

  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # change default shell to zsh
  chsh -s $(which zsh)
}

install_zsh_addons() {

  # add syntax highlighting
  brew install zsh-syntax-highlighting

  # add auto completions
  brew install zsh-completions

}


config_zsh() {

  # Check for zsh, install bew if we don't have it
  if test ! $(which zsh); then
    echo "Installing zsh..."
    install_zsh
    install_zsh_addons
  fi

  # backup zsh
  mv ~/.zshrc ~/.zshrc_bk_`date +%Y-%m-%d`

  ln -s ~/macup/dotfile/zshrc ~/.zshrc
}



#########  APPLY  #########

apply_config() {

  # iterm2

  # tmux
  source ~/.tmux.conf

  # vim
  source ~/.vimrc

  # zsh
  source ~/.zshrc
}



#########  MAIN WORKFLOW  #########

echo "------------------------------"
echo "Installing brew"
install_brew
check_brew

echo "------------------------------"
echo "Brew Installing Productivity Application"
brew_install_productivity_app

echo "------------------------------"
echo "Brew Installing Utility Application"
brew_install_utility_app

echo "------------------------------"
echo "Brew Installing Development Application"
brew_install_development_app

echo "------------------------------"
echo "Brew Installing Command Line Toolkit"
brew_install_commandline_toolkit

echo "------------------------------"
echo "Cloning macup project"
clone_macup

echo "------------------------------"
echo "Configing alias"
config_alias

echo "------------------------------"
echo "Configing Git"
config_git

echo "------------------------------"
echo "Configing iTerms2"
config_iterm2

echo "------------------------------"
echo "Configing tmux"
config_tmux

echo "------------------------------"
echo "Configing zsh"
config_zsh

echo "------------------------------"
echo "Applying configuration"
apply_config

echo "------------------------------"
echo "Script completed. Enjoy 🙌"
