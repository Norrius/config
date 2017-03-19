# .files

### Cloning this repo

    git clone --bare git@github.com:Norrius/dotfiles.git $HOME/.dot.git
    alias .git='/usr/bin/git --git-dir=$HOME/.dot.git --work-tree=$HOME'
    .git checkout
    .git checkout -f
    .git config status.showuntrackedfiles no

