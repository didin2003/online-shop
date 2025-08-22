FROM python:3.11-slim

RUN PYTHONDONTWRITEBYTECODE=1
RUN PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirement.txt /app/

RUN pip install --upgrade pip && \
    pip install -r requirements.txt 

COPY . /app/

EXPOSE 8000

CMD ["/bin/sh", "-c", "python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000"]

