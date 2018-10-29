# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

alias g="git"
alias gst="git status -sb"
alias gc="git commit -m"
alias gcm="git co master"
alias gco="git co"
alias gad="git add --all ."
alias gap="git add -p"
alias gb="git branch"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
alias glog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias vscs-info="url http://assets.codestream.us/artifacts/dev/vscode-codestream/codestream-latest.info | cat"
alias cs-dev-vsix="curl http://assets.codestream.us/artifacts/dev/vscode-codestream/codestream-latest.vsix -o ~/Downloads/codestream-latest.vsix"

# Git clone, pass in the repo as 'username/repo'
glone() {
  git clone "git@github.com:$1"
}
