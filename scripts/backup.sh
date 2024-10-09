# $1 database name
# $2 backup name

pg_dump -p 5432 -U $POSTGRES_USER -h 127.0.0.1 $1 > /app/backups/$2.sql