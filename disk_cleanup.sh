# diagnostics
df -h
sudo du -h --max-depth=1 ~/ | sort -rh
flatpak list --size

# weekly:
rm -rf ~/.cache/google-chrome/*
rm -rf ~/.var/app/com.microsoft.Edge/cache/*
rm -rf ~/.cache/*
npm cache clean --force

# monthly:
flatpak uninstall --unused
sudo snap list --all | awk '/disabled/{print $1, $3}' | while read name rev; do
  sudo snap remove "$name" --revision="$rev"
done
docker system prune -a
docker volume prune
sudo journalctl --vacuum-time=7d


# Rare (deep cache clean):
rm -rf ~/.cache/*
rm -rf ~/.config/google-chrome/Default/Cache/*
rm -rf ~/.var/app/*/cache/*


# macos
docker system prune -a
docker volume prune
npm cache clean --force
brew cleanup -s
brew autoremove
