#!/bin/bash

# Nombre de la imagen y el contenedor
IMAGE_NAME="prueba-devops-app"
CONTAINER_NAME="container-prueba-devops"
PORT=5000
VOLUME_NAME="logdata"

echo "Eliminando contenedor anterior si existe uno ya creado"
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

echo "Eliminando imagen anterior..."
docker rmi $IMAGE_NAME 2>/dev/null

echo "Construyendo la imagen de Docker..."
docker build -t $IMAGE_NAME .

echo "Creacion de un volumen persistente si no existe..."
docker volume create $VOLUME_NAME 2>/dev/null

echo "Iniciando contenedor..."
docker run -d -p $PORT:$PORT --name $CONTAINER_NAME -v $VOLUME_NAME:/app/data $IMAGE_NAME

echo "Contenedor en ejecución. Accede a: http://localhost:$PORT"
