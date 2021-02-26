FROM python:3.7

WORKDIR /app
RUN git clone https://github.com/weijia/django-dev-server.git

WORKDIR /app/django-dev-server
RUN pip install -r requirements-python3.txt
RUN pip install django jupyter ipython django-extensions

RUN echo 'ALLOWED_HOSTS = ["*"]' >> local/local_settings/allowed_hosts.py
RUN echo 'INSTALLED_APPS += ("django_extensions",)' >> local/local_settings/settings.py

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
