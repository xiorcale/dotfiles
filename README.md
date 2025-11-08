# dotfiles

Personal dotfiles.

## Archinstall

to start archinstall, run as root:

```sh
archinstall --config-url https://raw.githubusercontent.com/xiorcale/dotfiles/refs/heads/main/archlinux/arch_configuration.json
```

## FreeBSD

To start the freebsd post-install, run as root:

```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/xiorcale/dotfiles/refs/heads/main/freebsd/freebsd-post-install.sh)" _ your-username-here
```
