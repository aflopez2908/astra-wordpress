# WordPress con Docker - Sincronización entre PCs

## Configuración inicial en cualquier PC
1. Clonar el repositorio: `git clone https://github.com/aflopez2908/astra-wordpress.git`
2. Ejecutar: `docker-compose up -d`
3. **IMPORTANTE**: Restaurar la base de datos:
   ```powershell
   # En Windows PowerShell:
   .\restore-database.ps1
   ```
   ```bash
   # En Linux/Mac:
   ./restore-database.sh
   ```
4. Ir a http://localhost:8080

## Flujo de trabajo para sincronizar cambios

### Cuando hagas cambios (imágenes, plugins, configuraciones):

```bash
# 1. Exportar nueva base de datos
docker exec wordpress_db mysqldump -u wp_user -pwp_pass --no-tablespaces wordpress > wordpress-backup.sql

# 2. Crear nueva imagen con tus cambios
docker commit wordpress_app feliperussi/mi-wordpress:v1.1

# 3. Subir la nueva imagen
docker push feliperussi/mi-wordpress:v1.1

# 4. Actualizar el docker-compose.yml con la nueva versión
# Cambiar: image: feliperussi/mi-wordpress:latest
# Por:     image: feliperussi/mi-wordpress:v1.1

# 5. Subir cambios al repositorio
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

# 4. Restaurar la base de datos actualizada
.\restore-database.ps1  # Windows
# o
./restore-database.sh   # Linux/Mac
```

## Comandos útiles
- `docker-compose up -d` - Levantar servicios
- `docker-compose down` - Parar servicios  
- `docker-compose pull` - Descargar última versión de imágenes
- `docker images` - Ver imágenes locales