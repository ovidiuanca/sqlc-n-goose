package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"

	_ "modernc.org/sqlite"
	"sqlc-n-goose/gen/dbstore"
)

func main() {
	ctx := context.Background()

	db, err := sql.Open("sqlite", "./tmp/goose.db")
	if err != nil {
		log.Fatal(err)
	}

	queries := dbstore.New(db)

	users, err := queries.ListUsers(ctx)

	if err != nil {
		log.Fatal(err)
	}

	for _, user := range users {
		fmt.Printf("ID: %d, Username: %s\n", user.ID, user.Username)
	}

	fmt.Println("Getting only one user")

	user, err := queries.GetUser(ctx, "admin")

	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("ID: %d, Username: %s\n", user.ID, user.Username)
}
