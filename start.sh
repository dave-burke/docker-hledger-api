#!/bin/bash

echo "host: ${HLEDGER_HOST:="0.0.0.0"}"
echo "port: ${HLEDGER_PORT:=8001}"
echo "file: ${HLEDGER_JOURNAL_FILE:=/data/hledger.journal}"
echo "static dir: ${HLEDGER_STATIC_DIR:=/static}"

exec hledger-api \
    --host $HLEDGER_HOST \
    --port $HLEDGER_PORT \
    --file "$HLEDGER_JOURNAL_FILE"
    --static-dir "$HLEDGER_STATIC_DIR"

