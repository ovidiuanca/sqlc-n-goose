-- +goose Up
INSERT INTO users (username) VALUES ('admin');
INSERT INTO users (username) VALUES ('john doe');
INSERT INTO users (username) VALUES ('hello world');

-- +goose Down
