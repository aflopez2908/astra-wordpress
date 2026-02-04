# WordPress Astra - Sistema de Sincronización Completo

Este repositorio contiene todo lo necesario para ejecutar tu WordPress en cualquier PC con Docker.

## 📦 Contenido

- **Docker Compose**: Configuración para WordPress + MySQL
- **wp-content/**: Todos los plugins, temas y uploads
- **wp-config.php**: Configuración de WordPress
- **wordpress-backup-complete.sql**: Base de datos completa (20.65 MB)
- **Scripts de restauración**: Para Windows y Linux/Mac

## 🚀 Instalación en Nuevo PC

### Para Windows (PowerShell):
```powershell
# 1. Clonar repositorio
git clone https://github.com/aflopez2908/astra-wordpress.git
cd astra-wordpress

# 2. Levantar WordPress
docker-compose up -d

# 3. Esperar 10 segundos y restaurar base de datos
./restore-database.ps1
```

### Para Linux/Mac:
```bash
# 1. Clonar repositorio
git clone https://github.com/aflopez2908/astra-wordpress.git
cd astra-wordpress

# 2. Levantar WordPress
docker-compose up -d

# 3. Esperar 10 segundos y restaurar base de datos
chmod +x restore-database.sh
./restore-database.sh
```

## 🌐 Acceso

- **URL**: http://localhost:8080
- **Base de datos**: wordpress
- **Usuario DB**: wp_user
- **Contraseña DB**: wp_pass

## 📁 Estructura

```
├── docker-compose.yml          # Configuración Docker
├── wp-config.php               # Configuración WordPress
├── wordpress-backup-complete.sql  # Base de datos completa
├── restore-database.ps1        # Script Windows
├── restore-database.sh         # Script Linux/Mac
└── wp-content/                 # Contenido WordPress
    ├── plugins/                # Todos los plugins
    ├── themes/                 # Todos los temas
    ├── uploads/                # Todas las imágenes/media
    └── languages/              # Idiomas
```

## 🔄 Hacer Cambios y Sincronizar

### 1. Trabajar normalmente en WordPress
- Hacer cambios en http://localhost:8080
- Instalar/configurar plugins
- Subir imágenes y contenido

### 2. Hacer backup cuando termines
```powershell
# Backup de base de datos
docker exec wordpress_db bash -c "mysqldump --single-transaction --no-tablespaces -u root -proot_pass wordpress" > wordpress-backup-complete.sql

# Subir cambios a GitHub
git add -A
git commit -m "Actualización de contenido WordPress"
git push
```

### 3. En otro PC
```powershell
git pull
docker-compose down
docker-compose up -d
./restore-database.ps1
```

## ⚠️ Notas Importantes

1. **Volúmenes locales**: Los archivos están mapeados localmente, todos los cambios se guardan en wp-content/
2. **Base de datos**: Siempre restaurar con el script después de clonar
3. **Imágenes**: Todas las imágenes están en wp-content/uploads/
4. **Plugins**: Todos los plugins están incluidos y configurados

## 🐳 Docker Hub

También disponible la imagen de WordPress: `feliperussi/mi-wordpress:v1.1`

---

✅ **Todo tu WordPress portable entre PCs** - Plugins, temas, imágenes, configuraciones y base de datos incluidos.