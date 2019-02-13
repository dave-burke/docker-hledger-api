#!/bin/bash

set -e

LEDGER="${1}"
if [[ ! -r "${LEDGER}" ]]; then
	echo "Must provide a ledger file to mount for testing"
	exit 1
fi

LEDGER_FILE="$(basename ${LEDGER})"
LEDGER_DIR="$(dirname ${LEDGER})"

TAG="hledger-api:test"
docker build --pull -t "${TAG}" .

docker run --rm -it -p 8001:8001 \
	--volume "${LEDGER_DIR}:/data:ro" \
	--env "HLEDGER_JOURNAL_FILE=/data/${LEDGER_FILE}" \
	${TAG}

