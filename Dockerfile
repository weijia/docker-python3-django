FROM python:3.7

WORKDIR /app
RUN git clone https://github.com/weijia/django-dev-server.git

WORKDIR /app/django-dev-server
RUN pip install -r requirements-python3.txt

RUN echo 'ALLOWED_HOSTS = ["*"]' >> local/local_settings/allowed_hosts.py

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
