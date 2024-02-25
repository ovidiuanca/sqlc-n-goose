APP_NAME 	  = sqlc-n-goose
GOOSE_COMMAND = GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING=./tmp/goose.db goose -dir db/migrations

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
	$(GOOSE_COMMAND) status

up:
	$(GOOSE_COMMAND) up

down:
	$(GOOSE_COMMAND) down

# Usage: make create name=create_users_table
create:
	$(GOOSE_COMMAND) create $(name) sql

validate:
	$(GOOSE_COMMAND) validate

reset:
	$(GOOSE_COMMAND) reset
