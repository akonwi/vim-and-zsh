alias subl="sublime"
alias zshconfig="mvim ~/.zshrc"
alias ohmy="vim ~/.oh-my-zsh"
alias theme="vim ~/.oh-my-zsh/themes/akonwi.zsh-theme"
alias mysqlstart="mysql.server start"
alias mysqlstop="mysql.server stop"
alias mysqlstatus="mysql.server status"
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false'
alias myvim='mvim ~/.vimrc'
#alias rake='noglob rake' # default zsh alias for this tries to use with bundler

# Git stuff
alias gad="git add ."
alias gcm="git commit -v -m"
alias gcma="git commit -v --amend -m"
alias gpu="git push"
alias grb="git rebase"

# mocha
alias mochacof="mocha --compilers coffee:coffee-script"

# node-webkit launcher
alias nw="~/Applications/node-webkit.app/Contents/MacOS/node-webkit"

# My functions
rail() { cd ~/rails/$1; }
_rail() { _files -W ~/rails -/; }
compdef _rail rail

# build a node-webkit app, pass in the name of what to call it
nw_build() {
  name='app'
  if [ "$1" ]
  then
    name=$1
  fi
  zip -r $name.nw *
}
compdef nw_build
