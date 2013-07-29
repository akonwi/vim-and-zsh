alias edit="sublime"
alias zshconfig="edit ~/.zshrc"
alias ohmy="vim ~/.oh-my-zsh"
alias theme="vim ~/.oh-my-zsh/themes/akonwi.zsh-theme"
alias mysqlstart="mysql.server start"
alias mysqlstop="mysql.server stop"
alias mysqlstatus="mysql.server status"
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false'

# Git stuff
alias gad="git add ."
alias gcm="git commit -v -m"
alias gcma="git commit -v --amend -m"
alias gpu="git push"

# My functions
rail() { cd ~/rails/$1; }
_rail() { _files -W ~/rails -/; }
compdef _rail rail
