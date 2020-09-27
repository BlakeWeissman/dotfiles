#!/bin/sh

i3status | while :
do
        read line
        echo "$( i3-msg -t get_tree | jq ".nodes|.[]|.|.nodes|.[]|.nodes|.[]|select(.name==\"__i3_scratch\")|.floating_nodes|.[]|.nodes|.[]|.name" | awk '$1=$1' ORS=' / ') | $line" || exit 1
done
