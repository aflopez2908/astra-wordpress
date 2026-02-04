# WordPress con Docker - Trabajo en Paralelo

## Configuración inicial (solo primera vez)
1. Clonar el repositorio
2. Ejecutar: `docker-compose up -d`
3. Ir a http://localhost:8080 y configurar WordPress

## Flujo de trabajo diario

### Para subir tus cambios:
```bash
# Agregar cambios
git add .

# Commit
git commit -m "Descripción de los cambios"

# Subir al repositorio
git push origin main
```

### Para bajar cambios de otro PC:
```bash
# Bajar últimos cambios
git pull origin main

# Reiniciar contenedores para aplicar cambios
docker-compose restart
```

## Estructura de carpetas
- `themes/` - Temas personalizados
- `plugins/` - Plugins personalizados
- `uploads/` - Archivos subidos (imágenes, etc.)
- `wordpress-data/` - Datos completos de WordPress

## Comandos útiles
- `docker-compose up -d` - Levantar servicios
- `docker-compose down` - Parar servicios
- `docker-compose restart` - Reiniciar servicios
- `docker-compose logs wordpress` - Ver logs