CREATE EXTENSION postgres_fdw;

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- 3.120.39.160
CREATE SERVER server1_fdw FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host '3.75.208.130', port '5432', dbname 'server1_db');
CREATE USER MAPPING FOR postgres SERVER server1_fdw OPTIONS (user 'postgres', password '1111');
CREATE FOREIGN TABLE users_server1 (
    id UUID,
    username VARCHAR(50),
    email VARCHAR(100)
) SERVER server1_fdw OPTIONS (schema_name 'public', table_name 'users');