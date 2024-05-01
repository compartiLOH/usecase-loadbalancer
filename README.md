# usecase-loadbalancer
Example of LB usecase for compartiloh

Para pruebas locales construir la imagen

```
docker build -t lb-nginx .
```

Se debe correr con la configuracion para poder apuntar localmente a otro serivicio.. Suponiendo que tenemos 3 servicios corriendo en `localhost:10001`, `localhost:10002` y `localhost:10003` se ejecuta el siguiente comando:

```
docker run --name=lb-nginx --rm -e BACKEND_SERVERS="server host.docker.internal:10001; server host.docker.internal:10002; server host.docker.internal:10003" -p 10080:8080 --add-host=host.docker.internal:host-gateway lb-nginx
```

En este caso para acceder al balanceador simplementa apuntar a `localhost:100080`

La variable `host.docker.internal` se utiliza para poder acceder a `localhost` desde el contenedor de docker, esto debe habilitarse mediante el flag `--add-host=host.docker.internal:host-gateway`.

Otra opcion es pasar como servidores localhost y usar el flag `--net=host`.

```
BACKEND_SERVERS="server localhost:10001; server localhost:10002; server localhost:10003"
```