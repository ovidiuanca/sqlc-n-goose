-- name: ListUsers :many
SELECT * FROM users ORDER BY username;

-- name: GetUser :one
SELECT * FROM users WHERE username = :username;
