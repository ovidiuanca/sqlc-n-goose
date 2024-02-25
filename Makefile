APP_NAME=sqlc-n-goose

default: run

build:
	go build main.go

run:
	go run $(APP_NAME)

clean:
	rm -f $(APP_NAME)
	go clean

test:
	go test -v ./...

# Migrations

status:
	GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING=./tmp/goose.db goose -dir db/migrations status

up:
	GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING=./tmp/goose.db goose -dir db/migrations up

down:
	GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING=./tmp/goose.db goose -dir db/migrations down

create:
	GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING=./tmp/goose.db goose -dir db/migrations create $(name) sql

validate:
	GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING=./tmp/goose.db goose -dir db/migrations validate

reset:
	GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING=./tmp/goose.db goose -dir db/migrations reset
