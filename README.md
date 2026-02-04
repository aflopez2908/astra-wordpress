# WordPress con Docker - Sincronización entre PCs

## Configuración inicial en cualquier PC
1. Clonar el repositorio: `git clone [url-del-repo]`
2. Ejecutar: `docker-compose up -d`
3. Ir a http://localhost:8080

## Flujo de trabajo para sincronizar cambios

### Cuando hagas cambios (imágenes, plugins, configuraciones):

```bash
# 1. Crear nueva imagen con tus cambios
docker commit wordpress_app feliperussi/mi-wordpress:v1.1

# 2. Subir la nueva imagen
docker push feliperussi/mi-wordpress:v1.1

# 3. Actualizar el docker-compose.yml con la nueva versión
# Cambiar: image: feliperussi/mi-wordpress:latest
# Por:     image: feliperussi/mi-wordpress:v1.1

# 4. Subir cambios al repositorio
git add .
git commit -m "Actualización a v1.1 - descripción de cambios"
git push origin main
```

### En el otro PC para obtener los cambios:

```bash
# 1. Descargar cambios del repositorio
git pull origin main

# 2. Descargar la nueva imagen
docker-compose pull

# 3. Reiniciar contenedores
docker-compose down
docker-compose up -d
```

## Comandos útiles
- `docker-compose up -d` - Levantar servicios
- `docker-compose down` - Parar servicios  
- `docker-compose pull` - Descargar última versión de imágenes
- `docker images` - Ver imágenes locales