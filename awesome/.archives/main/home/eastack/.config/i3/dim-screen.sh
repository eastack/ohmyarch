#!/bin/zsh

trap 'exit 0' TERM INT
trap "light -I; kill %%" EXIT

light -O

while (( $(light) > 0.5 )); do
	light -U 0.1
	sleep 0.1
done

sleep 2147483647 &
wait
