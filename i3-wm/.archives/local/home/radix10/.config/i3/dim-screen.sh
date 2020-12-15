#!/bin/zsh

trap 'exit 0' TERM INT
trap "light -I; kill %%" EXIT

light -O
while (( $(light) > 1 )); do
	light -U 0.2
	sleep .1
done

sleep 2147483647 &
wait
