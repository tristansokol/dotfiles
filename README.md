# dotfiles

Installing `.gitconfig`
1. clone this repo
2. make a copy of existing `.gitconfig`: `mv ~/.gitconfig "~/.gitconfig$(date +"%m-%d-%y-%r")"`
3. symlink from the repo to your gitconfig: `ln -is ~/Development/dotfiles/git/gitconfig ~/.gitconfig`

Installing `.gitignore`
1. clone this repo
2. make a copy of existing `.gitignore`: `mv ~/.gitignore "~/.gitignore$(date +"%m-%d-%y-%r")"`
3. symlink from the repo to your gitignore: `ln -is ~/Development/dotfiles/git/gitignore ~/.gitignore`

Install Zsh
`sudo apt install zsh`
`chsh -s $(which zsh)`

Install Oh My Zsh
https://ohmyz.sh/#install

Install zsh-autosuggestions
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

Install Powerlevel10k
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"`

And nerd font
https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k

symlink .zsh and .p10k.zsh

* `ln -is ~/Development/dotfiles/shell/.zshrc ~/.zshrc`
* `ln -is ~/Development/dotfiles/shell/.p10k.zsh ~/.p10k.zsh`

symlink in aliases

* `ln -is  ~/Development/dotfiles/shell/aliases.zsh $ZSH_CUSTOM/aliases.zsh` 
