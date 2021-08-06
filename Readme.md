El archivo docker-compose.yml se utiliza para desarrollo mientras que el archivo production.yml se usa para produccion


# Comandos utiles para desarrollar

*Levantar Odoo*

docker-compose exec web ./odoo-bin


*Actualizar el modulo de asw_amce con la db test*
docker-compose exec web ./odoo-bin -d test -u asw_amce


