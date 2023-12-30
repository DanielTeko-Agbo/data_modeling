FROM python:3.10-slim

WORKDIR /var/www/html/data-modeling

COPY . .

COPY ./requirements.txt /var/www/html/data-modeling/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt