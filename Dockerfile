FROM python:3.14-rc-slim
RUN apk add --no-cache sqlite-dev

WORKDIR /home/src
RUN pip install flask peewee gunicorn
COPY . .
CMD ["gunicorn", "app:app", "--workers", "20", "--timeout", "2", "-b", "0.0.0.0:1002"]
