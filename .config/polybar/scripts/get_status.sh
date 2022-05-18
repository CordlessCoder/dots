#!/bin/bash

# The name of polybar bar which houses the main spotify module and the control modules.
PARENT_BAR="${1:-music}"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

urldecode() {
	: "${*//+/ }"
	echo -e "${_//%/\\x}"
}

send_hook() {
	[ -z "$1" ] && echo "send_hook: missing arg" && exit 1
}

extract_meta() {
	grep "$1\W" <<<"$meta" | awk '{$1=$2=""; print $0}' | sed 's/^ *//; s/; */;/g' | paste -s -d/ -
}

# if "icon" given, determine icon. otherwise, print metadata
get_info() {
	if [ -z "$1" ]; then
		echo "Usage: get_info PLAYER [icon]"
		exit 1
	fi

	meta=$(playerctl -p "$1" metadata)

	# get title
	title=$(extract_meta title)
	# if no title, try url e.g. vlc
	if [ -z "$title" ]; then
		title=$(extract_meta url)
		title=$(urldecode "${title##*/}")
	fi

	# if not "icon", display information and return
	if [ "$2" != "icon" ]; then
		artist=$(extract_meta artist)
		[ -z "$artist" ] && artist=$(extract_meta albumArtist)
		echo "%{F#C0CAF5}$(echo $title | cut -c -40)  "

		if [ -n "$artist" ]; then
			album=$(extract_meta album)
			[ -n "$album" ] && echo -n "$(echo $album | cut -c -26) %{F#7DCFFF} "

			echo -n "%{F#C0CAF5}$(echo $artist | cut -c -26) %{F#7AA2F7}ﴁ "
		fi

		return 0
	fi
}

# manually go through players
read -d'\n' -ra PLAYERS <<<"$(playerctl -l 2>/dev/null)"
declare -a PAUSED
for player in "${PLAYERS[@]}"; do
	[ "$player" = "playerctld" ] && continue

	p_status=$(playerctl -p "$player" status 2>/dev/null)

	# if we have one playing, we'll use it and EXIT
	if [ "$p_status" = "Playing" ]; then
		send_hook 1
		get_info "$player" "$2"
		exit 0
	fi

	[ "$p_status" = "Paused" ] && PAUSED+=("$player")
done

# if we have a paused, show it otherwise assume there are no players or have all stopped
if [ -n "${PAUSED[0]}" ]; then
	send_hook 2
	get_info "${PAUSED[0]}" "$2"
else
	[ "$2" = icon ] && echo "none" || echo " %{F#7DCFFF}鈴 no players %{F-}"
fi
