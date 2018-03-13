![ANDES](https://github.com/andes/andes.github.io/raw/master/images/logo.png)

# ANDES Docker

## Demo

Para realizar una demo de ANDES simplemente ejecutar los siguientes comando:

```bash
docker-compose -f andes-demo.yml up -d
./seed.sh
```

El script seed.sh es utilizado para llenar la base de datos de ANDES con datos iniciales. Solo debe ser ejecutado una vez. 

Una vez ejecutado los comando, navegar a la dirección http://localhost. 

Usuario de acceso:
 - DNI. 30000000
 - Password: Cualquiera

**(Proximamente comandos para windows)**

## Desarrollo

Para desarrolladores, el archivo `arquitectura.yml` levanta toda la arquitectura necesaria para un desarrollo local (Mongo 3.4, ElasticSearch y Kibana). 
También existe una versión `arquitectura-disk.yml`, la cuál crea las bases de datos en el disco local. 

```bash
docker-compose -f arquitectura.yml up -d
./seed.sh
```

### Api y App

Tanto la Api y la App se puede levantar con Docker para desarrollo. Cada repositorio incluye su Dockerfile y una lista de comandos útiles para su rápida implementación.


