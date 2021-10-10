# Estructuras de datos

## Como generar un archivo Dump (MariaDB)

Instalar utilierias en Linux

``` bash
sudo apt-get install -y mariadb-client
```

Ejecutar mysqldump

``` bash
mysqldump --no-data -u root -p tbd_autos > dump_tbd_autos.sql
```

## Generar archivo Dump desde un contenedor de Docker

Ejecutar el siguiente comando desde la linea de comandos donde se esta ejecutando Docker

``` bash
sudo docker exec $ONTAINER_ID /usr/bin/mysqldump -u root --password=$PASSWORD_ROOT tdb_autos > ump_tbd_autos.sql

```

Depositar el archivo en la ruta dumps
