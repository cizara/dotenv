#!/bin/sh
# Updates weather forecast

ip r | while read Def _ IP _; do
	case $Def in
	default)
		ping -q -w 1 -c 1 "$IP" >/dev/null || exit

		break
		;;
	esac
done

#location="$1"; [ -z "$location" ] || location="$location+"
#curl -s wttr.in/shiraz?format=4
#pkill -RTMIN+5 i3blocks && notify-send "🌞 Weather forecast updated."
ansiweather -l "Ciudad Autónoma de Buenos Aires" -u metric -s true -f 0 -a false | cut -d' ' -f7-9
#clweather --latitude 29.6068 --longitude 52.5376 -t #API KEY
#echo 'not now'
