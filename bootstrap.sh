#!/usr/bin/env bash
fancy_echo() {
  local fmt="$1"; shift
  printf "$fmt\n" "$@"
}

cd "$(dirname "${BASH_SOURCE}")";

fancy_echo "Pulling latest dotfiles changes..."
git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
