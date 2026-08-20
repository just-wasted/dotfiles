#!/usr/bin/env bash

ignore=".git .gitignore mklinks.sh"

cd "$(dirname "$0")"
shopt -s dotglob
mkdir -p ../.config


is_excluded() {
	for x in $ignore; do
		case "$1" in *"$x"*) return 0;; esac
	done
	return 1
}


make_link() {
	shopt -s dotglob
	local src="$1" dst="$2"

	[ -e "$src" ] || return
	[ -L "$src" ] && return
	[ -e "$dst" ] && [ ! -L "$dst" ] && return

	if [ -L "$dst" ]; then
		current=$(readlink "$dst")
		expected=$(realpath "$src")
		[ "$current" = "$expected" ] && return
	fi

	ln -sf "$(realpath "$src")" "$dst"
}


for f in *; do
	[ "$f" = ".config" ] && continue
	is_excluded "$f" || make_link "$f" "../$f"
done


[ -d ".config" ] && {
	cd .config
	for f in *; do
		make_link "$f" "../../.config/$f"
	done
	cd ..
}
