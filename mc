#!/bin/sh
cd $HOME/.local/share/minecraft
MCPROFILES="${MCDOTDIR:-$HOME/.config/mc}/profiles"
MCPASSWD="${MCDOTDIR:-$HOME/.config/mc}/passwd"
SELECTED="$(cat "$MCPROFILES" | sed "s/\t.*$//g" | dmenu -l 30 -p "Please select a profile:")"
ARGS="$(grep "$SELECTED" "$MCPROFILES" | cut -f2 -d"	")"
[ -e ${MCNOKILLFILE:-/tmp/mcnokill} ] || killall java
minecraft-launcher-cmd --username $(sed -n 1p "$MCPASSWD") --password $(sed -n 2p "$MCPASSWD") "$ARGS"
