#!/bin/bash

function usage() {
  echo "Uso: test-load.sh <qtd> <url>"
  echo "onde: <qtd>: quantidade de acessos a fazer"
  echo "      <url>: url a acessar"
  exit 1
}

[ -n "$1" ] && [ -n "$2" ] || usage
for i in `seq 1 $1`; do
  bash -c "curl -s $2 > /dev/null && echo -n . || echo -n \!" &
done
wait
echo
