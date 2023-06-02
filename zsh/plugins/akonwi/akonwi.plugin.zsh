alias zshconfig="zed ~/.zshrc"
alias ohmy="zed ~/dev/vim-and-zsh/zsh"
alias mysqlstart="mysql.server starts"
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false'

## Git stuff
alias g="git"
alias gad="git add --all ."
alias gap="git add -p"
alias gb="git branch"
alias gc="git commit -m"
alias gcm="git co master"
alias gco="git co"
alias gpu="git push"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
alias gst="git status -sb"
alias glog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Yarn
alias yw="yarn workspace"

## functions

# Git clone, pass in the repo as 'username/repo'
glone() {
  git clone "git@github.com:$1"
}