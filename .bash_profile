# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
    exec dbus-run-session sway
fi

export PATH="$HOME/.cargo/bin:$PATH"
