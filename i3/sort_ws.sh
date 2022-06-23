#!/bin/bash
getWorkspaceList() {
    i3-msg -t get_workspaces \
        | jq '.[] | select(.num != -1 ) | .num' \
        | sort --numeric-sort
}

main() {
    ((i=1))
    while IFS=$'\n' read -r workspace; do
       printf "renaming workspace '%s' to '%s'\\n" "$workspace" "$i" 
       i3-msg rename workspace "$workspace" to "$i"  
       ((i++))
    done < <(getWorkspaceList)
}

#set -x
main
#set +x
