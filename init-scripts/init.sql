CREATE EXTENSION postgres_fdw;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Server1 uchun
CREATE SERVER server1_fdw FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host '13.38.70.151', port '5432', dbname 'server1_db');
CREATE USER MAPPING FOR postgres SERVER server1_fdw OPTIONS (user 'postgres', password 'your_password');
CREATE FOREIGN TABLE users_server1 (
    id INTEGER,
    username VARCHAR(50),
    email VARCHAR(100)
) SERVER server1_fdw OPTIONS (schema_name 'public', table_name 'users');