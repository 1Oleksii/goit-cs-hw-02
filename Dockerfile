FROM python:3.10-slim

WORKDIR /app

# Копіюємо файл із залежностями і встановлюємо пакети
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо всі файли проєкту в контейнер
COPY . .

# Перевіряємо, що всі файли (включно з main.py) є в робочій теці /app
RUN ls -la /app

# Запускаємо FastAPI застосунок
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
