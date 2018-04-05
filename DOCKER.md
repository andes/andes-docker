# Docker: Comandos útiles

Listado de comandos y ejemplos introductorios a Docker.

#### Descargar una imagen

Para descargar una imagen desde  __Docker Cloud__ utilizar el comando pull.

```
docker pull [IMAGE]:[TAG]
```

Ejemplo: `docker pull mongo:3.4`


#### Crear una imagen

Con el comando __build__ podemos crear una imagen local de un repositorio. Siempre y cuando tenga el archivo Dockerfile 

```bash
docker build -t [IMAGE]:[TAG]  [Dockerfile]
```
 
 Ejemplo: `docker build -t andesnqn/api .`

#### Correr una imagen en un contenedor

Con el comando __run__ podemos crear un contenedor para una imagen específica. Nos permite correr varias instancias de la imagen __mongo__ que nos descargamos anteriormente, de forma totalmente independiente. Docker nos permite hacer port forwarding para poder acceder a los servicios encapsulados.

```bash
docker run  -p  [LOCAL]:[REMOTE] --rm --name [CONTAINER_NAME] [IMAGE_NAME] 
```

Ejemplo: `docker run  -p 3002:3002  --rm --name andes_api andesnqn/api `

Si navegamos a la dirección __http://localhost:3002__, vemos que podemos acceder directamente a la api de Andes. 

#### Montar directorios local

Con la opción `-v` del comando __run__ podemos montar una carpeta local dentro del contenedor para compartir archivos. Esto nos permite, compartir el código de la aplicación con el contenedor y lograr que se refleje automaticamente los cambios. 

Ejemplo: `docker run -v  ${pwd}:/usr/src/api  -p  3002:3002  --rm --name andes_api andesnqn/api`

Este opción es la ideal para los desarrolladores.

#### Ejecutar un comando dentro del contenedor

La opción __exec__ de Docker nos permite correr comandos dentro del contenedor. 

```
docker exec [CONTAINER_NAME] [COMANDO]
```

Ejemplos: 
    - `docker exec andes_api npm install @andes/plex@latest --save`
    - `docker exec andes_api ls`
    - `docker exec andes_db mongorestore --gzip --archive=/mongo-dump.gzip`


#### Logs

Muestra los logs de un contenedor

```
docker logs [CONTAINER_NAME]
```
Ejemplos: `docker logs andes_api`


#### Detener un contenedor

```
docker stop [CONTAINER_NAME]
```

#### Listar los contenedores activos

```
docker ps 
```

#### Tips
Para no tener que correr Docker con __sudo__: 

```
sudo usermod -aG docker $USER
```
