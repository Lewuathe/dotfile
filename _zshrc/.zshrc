# Load zsh extentions
for ext_file ($ZSH/extentions/*.zsh) source $ext_file
if [ -f ~/.zsh/extentions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/extentions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Load all of zsh config files
for config_file ($ZSH/*.zsh) source $config_file

# rvm
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
    source "$HOME/.rvm/scripts/rvm"
    export PATH="`gem env | perl -ne 'print $1 if /EXECUTABLE DIRECTORY: (.+)$/'`":$PATH
fi

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
[ -x "`which rbenv 2>/dev/null`" ] && eval "$(rbenv init -)"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

if [ "$ITERM_PROFILE" != "Hotkey Window" -a \
     $SHLVL -eq 1 -a -x "`which screen 2>/dev/null`" ]; then
    screen -UxR
fi

# uniq path
typeset -U path

# vim: set ft=zsh :
export PATH="$HOME/anaconda/bin:$HOME/.rbenv/bin:$PATH"
#export JAVA_HOME=/Library/Java/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home 
export PATH=$JAVA_HOME/bin:$PATH
export SCALA_HOME=/usr/local/share/scala-2.10.2
export PATH=$PATH:$SCALA_HOME/bin
export PATH=$PATH:$HOME/bin/
eval "$(rbenv init -)"

/usr/local/bin/emacs --daemon

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

[[ -s /Users/sasakiumi/.nvm/nvm.sh ]] && . /Users/sasakiumi/.nvm/nvm.sh # This loads NVM


alias emacs="emacsclient -nw"
alias work="cd ~/Dropbox/MyWorks"
