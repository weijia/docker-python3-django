FROM python:3.8

WORKDIR /app
RUN git clone https://github.com/weijia/django-dev-server.git

WORKDIR /app/django-dev-server
RUN pip install -r requirements-python3.txt
RUN pip install mysqlclient

RUN echo 'ALLOWED_HOSTS = ["*"]' >> local/local_settings/allowed_hosts.py
RUN echo 'DEFAULT_AUTO_FIELD="django.db.models.AutoField"' >> local/local_settings/python3_related_settings.py


EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
