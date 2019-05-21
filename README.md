![ANDES](https://github.com/andes/andes.github.io/raw/master/images/logo.png)

# ANDES Docker



## Demo

¿Interesado en probar ANDES? Podés realizar una prueba rápida solamente con [Docker](https://www.docker.com/get-docker) instalado.

Cloná el repositorio o descargar el archivo andes-demo.yml y ejecuta el siguiente comando:


```bash
docker-compose -f andes-demo.yml up -d
```

Docker va a descargar de la nube todas las dependencias necesarias para realizar las pruebas. Por única vez, cuando el sistema ya esta corriendo, debes llenar la base de datos con algunos datos de ejemplo, para esto hay que ejecutar el script `seed.sh`.

Por último, debes acceder a http://localhost desde tu navigador favorito. Usuario de acceso:

 - DNI. 30000000
 - Password: Cualquiera


## Desarrolladores

Para los desarrolladores de ANDES, el archivo `arquitectura.yml` levanta toda la arquitectura necesaria para poder desarrollar de forma local (Mongo 4.0, Elasticsearch y Kibana).  
Otra opción es usar el archivo `arquitectura-disk.yml`, el cuál monta el directorio local para crear los directorios de las base de datos. 

```bash
docker-compose -f arquitectura.yml up -d
```

Si no queremos arrancar de cero con los datos, se puede restaurar un dump de Mongo comprimido con el siguiente comando:

```bash
docker cp mongo-dump.gzip andes_db:/mongo-dump.gzip
docker exec andes_db mongorestore --gzip --archive=/mongo-dump.gzip
```

Por último, tener en cuenta que cada servicio corre en su puerto por default. Así que para conectarse a cada uno, hay que usar la url __localhost__ y el puerto correspondiente:

- __Mongo__: mongodb:localhost:27017
- __Elasticsearch__: localhost:9200
- __Kibana__: localhost:5601


### Desarrollo Api y App

También se puede usar Docker para correr la Api y la App para desarrollar. Cada repositorio incluye su Dockerfile y una lista de comandos útiles, que explican como utilizarlo. O ver este [manual](DOCKER.md). 




