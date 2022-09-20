FROM python:3.7-slim

# Создать директорию вашего приложения.
WORKDIR /app

# Скопировать с локального компьютера файл зависимостей
# в директорию /app.
COPY api_yamdb/requirements.txt /app

# Выполнить установку зависимостей внутри контейнера.
RUN pip3 install -r /app/requirements.txt --no-cache-dir

# Скопировать содержимое директории /api_yamdb c локального компьютера
# в директорию /app.
COPY . /app


# Выполнить запуск сервера разработки при старте контейнера.
CMD ["gunicorn", "api_yamdb.wsgi:application", "--bind", "0:8000" ]