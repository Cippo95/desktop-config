#!/bin/bash

var="$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name')" 
#if [ "$var" != '"1"' ]; then
	i3-msg move container to workspace $(($(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name'| cut -d '"' -f2) - 1))
#fi
