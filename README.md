# Netz39 Fees

## Deployment using docker-compose

### Getting started

Pull and build the images:
```
# Pulls the postgres image
docker-compose pull
# Builds the fees image
docker-compose build
```

First, edit the `.env` file. This is the configuration file of the application. The configuration values
are documented there.

Once you adjusted the values to your needs, run:

```
docker-compose up -d
```

This will start your application daemonized. To view the logs, use `docker-compose logs`.

### Loading an SQL dump

To interact with the database, use the `docker-compose exec` command:

```
docker-compose exec db bash -c 'PGPASSWORD="$POSTGRES_PASSWORD" psql -U "$POSTGRES_USER" "$POSTGRES_DB"'
```

To restore a dump:
```
docker-compose exec db bash -c 'PGPASSWORD="$POSTGRES_PASSWORD" psql -U "$POSTGRES_USER" "$POSTGRES_DB"' < dump.sql
```