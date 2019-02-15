#!/bin/bash

set -e
set -o pipefail
shopt -s nullglob

for init_script in /docker-entrypoint-init.d/*; do
    case "$f" in
	*.sh) echo "$0: running $init_script"; source "$init_script" ;;
	*)    echo "$0: ignoring $init_script" ;;
    esac
    echo
done

if [[ -z "$1" ]]; then
    /usr/bin/ss-server
fi

exec "$@"
