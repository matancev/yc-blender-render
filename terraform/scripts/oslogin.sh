#!/usr/bin/env bash

set -euxo pipefail

SSH_PUB_KEY=$1
USER_LOGIN=$2

echo "{\"key\":\"$(awk -F" " "{print \"${USER_LOGIN}\" \":\" \$1 \" \" \$2 \" \" \"${USER_LOGIN}\"}" "${SSH_PUB_KEY}")\"}"