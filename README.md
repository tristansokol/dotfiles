# dotfiles

Installing `.gitconfig`
1. clone this repo
2. make a copy of existing `.gitconfig`: `mv ~/.gitconfig "/Users/tristansokol/.gitconfig$(date +"%m-%d-%y-%r")"`
3. symlink from the repo to your gitconfig: `ln -is ~/Development/dotfiles/git/gitconfig ~/.gitconfig`
