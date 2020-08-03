FROM python:3.7

WORKDIR /usr/src/app
RUN git clone https://github.com/weijia/django-dev-server.git

WORKDIR /usr/src/app/django-dev-server
RUN pip install -r requirements-python3.txt -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com

RUN echo 'ALLOWED_HOSTS = ["*"]' >> local/local_settings/allowed_hosts.py

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]