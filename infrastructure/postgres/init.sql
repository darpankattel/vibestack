-- Create separate schemas for microservices
CREATE SCHEMA IF NOT EXISTS auth_schema;
CREATE SCHEMA IF NOT EXISTS backend_schema;

-- Grant permissions
GRANT ALL PRIVILEGES ON SCHEMA auth_schema TO postgres;
GRANT ALL PRIVILEGES ON SCHEMA backend_schema TO postgres;