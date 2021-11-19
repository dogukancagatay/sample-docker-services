# pgAdmin4 without Password

A sample pgAdmin4 service configuration features a pgAdmin4 instance that is accessible without username password and pre-configured server configuration.


By default, pgAdmin4 requires username password and server configuration when started inside a container. However, when using it on development (can use desktop app), or in ephemeral dev environments, we need some provisioning for the server list and passwords etc.

## Files

- `config/servers.json`: A server configuration file.
- `config/pgpass`: A password file for the db access.


### References:
- pgpass file reference: https://www.postgresql.org/docs/current/libpq-pgpass.html
- config.py file reference: https://www.pgadmin.org/docs/pgadmin4/development/config_py.html
- pgAdmin container deployment reference: https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html
- A tutorial about provisioning pgAdmin: https://technology.amis.nl/continuous-delivery/provisioning/pgadmin-in-docker-provision-connections-and-passwords/
- servers.json sample: https://github.com/postgres/pgadmin4/blob/master/web/pgadmin/setup/tests/servers.json

