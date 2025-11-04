docker system prune

df -h

sudo du -h --max-depth=1 ~/ | sort -rh

flatpak list --size

# add into .zshrc
alias gnucash='WEBKIT_DISABLE_COMPOSITING_MODE=1 flatpak run org.gnucash.GnuCash'
