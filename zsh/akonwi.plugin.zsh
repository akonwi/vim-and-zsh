alias zshconfig="vim ~/.zshrc"
alias ohmy="vim ~/.oh-my-zsh/custom/plugins/akonwi/akonwi.plugin.zsh"
alias theme="vim ~/.oh-my-zsh/themes/akonwi.zsh-theme"
alias mysqlstart="mysql.server start"
alias mysqlstop="mysql.server stop"
alias mysqlstatus="mysql.server status"
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false'
alias myvim='vim ~/.vimrc'
#alias rake='noglob rake' # default zsh alias for this tries to use with bundler

# Git stuff
alias g="git"
alias gad="git add --all ."
alias gb="git branch"
alias gc="git commit -m"
alias gcm="git co master"
alias gco="git co"
alias gpu="git push"
alias grb="git rebase"
alias gst="git status -sb"
alias glog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# mocha
alias mochacof="mocha --compilers coffee:coffee-script/register"

# node-webkit launcher
alias nw="~/Applications/node-webkit.app/Contents/MacOS/node-webkit"

# My functions
nodes() { cd ~/projects/node/$1; }
_nodes() { _files -W ~/projects/node -/; }
compdef _nodes nodes

# Git clone, pass in the repo as 'username/repo'
glone() {
  git clone "git@github.com:$1"
}

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
