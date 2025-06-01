# Базовый образ Python
FROM python:3.10-slim

# Установка зависимостей
RUN apt update && apt install -y gcc

# Рабочая директория
WORKDIR /app

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь код
COPY . .

# Команда запуска
CMD ["python", "main.py"]