# Usar una imagen oficial garantiza compatibilidad y seguridad
FROM python:3.11-slim

# Definimos el directorio de trabajo dentro del contenedor
# Todo lo que hagamos después ocurrirá dentro de /app
WORKDIR /app

# Copiamos primero el archivo de dependencias
# Esto permite que Docker reutilice esta capa si no cambia el requirements.txt
COPY requirements.txt .

# Instalamos las dependencias listadas en requirements.txt
# --no-cache-dir evita guardar archivos innecesarios, reduciendo el tamaño de la imagen
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto del código fuente al contenedor
COPY . .

# Comando que se ejecutará cuando se inicie el contenedor
CMD ["python", "app.py"]