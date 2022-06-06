CREATE TABLE IF NOT EXISTS user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT,
    first_name TEXT,
    last_name TEXT
);
---
CREATE TABLE IF NOT EXISTS strava (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user INTEGER REFERENCES user (id),
    auth_token TEXT,
    refresh_token TEXT
);