#!/bin/bash

tmux_start_usage()
{
cat << EOF

Usage: $0 <-n window number> [-N window name]

EOF

}

if [ $# -le 1 ]; then
    tmux_start_usage
fi

# echo =================
# echo dd$1
# echo =================
# echo $2
# echo =================
# echo $3
# echo =================
# echo $4
# echo =================
#
# exit 2

TEMP=$(getopt -o 'n:N:O:' -l 'num:,name:' -- "$@")
eval set -- $TEMP
unset TEMP

win_name=''

while true; do
    case $1 in
        '-n' | '--num')
            win_num="$2"
            shift 2
            continue
            ;;
        '-N' | '--name')
            win_name+="$2 "
            shift 2
            continue
            ;;
        '-O')
            shift 2
            continue
            ;;
        '--')
            break
            ;;
        *)
            echo error
            exit 1
            ;;
    esac
done

for name in $win_name; do
    tmux new-window -P -n $name
done


