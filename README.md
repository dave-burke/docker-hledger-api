# Docker hledger API

A docker container for serving the hledger API.

Swagger docs are served at `/static/docs/index.html`.

Mount your own static UI under `/static` (e.g. `/static/app`).

## Run

```bash
docker run -p 8001:8001 -v "/path/to/your/ledger/:/data/" hledger-api
```

Example test:

```
curl localhost:8001/api/v1/accounts | jq
```

## Environment variables

```bash
HLEDGER_HOST="0.0.0.0"
HLEDGER_PORT=8001
HLEDGER_JOURNAL_FILE=/data/hledger.journal
HLEDGER_STATIC_DIR=/static
```
