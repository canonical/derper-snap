#!/bin/bash

set -euo pipefail

DEFAULT_HOSTNAME="$(hostname)"
DEFAULT_VERIFY_CLIENTS="true"

get_hostname() {
  host="$(snapctl get hostname)"
  if [ -z "$host" ]; then
    host="$DEFAULT_HOSTNAME"
    set_hostname $host
  fi
  echo "$host"
}

set_hostname() {
  snapctl set hostname="$1"
}

get_verify_clients() {
  vc="$(snapctl get verify-clients)"
  if [ -z "$vc" ]; then
    vc="$DEFAULT_VERIFY_CLIENTS"
    set_verify_clients $vc
  fi
  echo "$vc"
}

set_verify_clients() {
  snapctl set verify-clients="$1"
}
