# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
. ~/.bin/z

# init resty
. ~/.bin/resty

# init rbenv
eval "$(rbenv init -)"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer UK English and use UTF-8
export LC_ALL="en_GB.UTF-8"
export LANG="en_GB"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Change the directories colour to yellow because it's just too dark
export LS_COLORS='di=01;33'

# Initialise nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
