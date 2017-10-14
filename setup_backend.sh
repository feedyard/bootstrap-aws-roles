#!/usr/bin/env bash

cat <<EOF > backend.conf
key="bootstrap-$1-roles/auth.tfstate"
bucket="feedyard-$1-local"
region="$2"
profile="default"
EOF