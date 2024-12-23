# dotfiles

Installing `.gitconfig`
1. clone this repo
2. make a copy of existing `.gitconfig`: `mv ~/.gitconfig "~/.gitconfig$(date +"%m-%d-%y-%r")"`
3. symlink from the repo to your gitconfig: `ln -is ~/Development/dotfiles/git/gitconfig ~/.gitconfig`

Installing `.gitignore`
1. clone this repo
2. make a copy of existing `.gitignore`: `mv ~/.gitignore "~/.gitignore$(date +"%m-%d-%y-%r")"`
3. symlink from the repo to your gitignore: `ln -is ~/Development/dotfiles/git/gitignore ~/.gitignore`

Install Oh My Zsh 
https://ohmyz.sh/#install
And nerd font

symlink .zsh and .p10k.zsh

* `ln -is ~/Development/dotfiles/shell/.zshrc ~/.zshrc`
* `ln -is ~/Development/dotfiles/shell/.p10k.zsh ~/.p10k.zsh`

symlink in aliases

* `ln -is  ~/Development/dotfiles/shell/aliases.zsh $ZSH_CUSTOM/aliases.zsh` 
