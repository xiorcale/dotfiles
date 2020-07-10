# dotfiles

Personal dotfiles for a gruvy Sway desktop environment.

## Setup

Clone the repository:

```
git clone --bare git@github.com:xiorcale/dotfiles.git $HOME/Dotfiles
```

Define an alias (which is configured persistently in the dotfiles, but since
the repository is not checkout yet, we have to define it by hand):

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME'
```

Finally, apply the changes from the repository to your system:

```
dotfiles checkout
```

## Void Linux

On Void Linux, the `.config/void-post-install.sh` script can be used to install and
configure the necessary packages/services used in these dotfiles to be up an running faster.

Note: some packages are hardware specific (e.g. Intel) and may need to be tuned
depending on the hardware used.

## References

[1] [Manage dotfiles with Git](https://news.opensuse.org/2020/03/27/Manage-dotfiles-with-Git/)
