## Передаем в Dockerfile аргумент PYTHON_VERSION, значение по умолчанию - 3.11
ARG PYTHON_VERSION=3.11

FROM python:${PYTHON_VERSION}-slim
# Устанавливаем рабочую директорию в базовом образе для команд COPY, RUN, ENTRYPOINT и CMD
WORKDIR /app
# Копируем с хоста в образ файл с требуемыми зависимостями
COPY requirements.txt ./
# Устанавливаем зависимости внутри образа
RUN pip install --no-cache-dir -r requirements.txt
# Копируем код приложения в контейнер, одновременно выставляя нужные разрешения
COPY --chmod=744 Zapros.py ./
# Задаем команду, которая будет запускаться при старте контейнера
ENTRYPOINT [ "python" ]
# Задаем аргументы по умолчанию для команды в ENTRYPOINT
CMD [ "Zapros.py" ]

