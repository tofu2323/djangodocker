FROM python:3.6

ENV PYTHONUNBUFFERED 1

ARG requirements=requirements/production.txt
ARG DJANGO_SETTINGS_MODULE=djangodocker.settings.production
ARG SECRET_KEY
ARG ALLOWED_HOST

ENV DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
ENV SECRET_KEY=$SECRET_KEY
ENV ALLOWED_HOST=$ALLOWED_HOST

WORKDIR /app

COPY djangodocker djangodocker
COPY manage.py /app/
COPY requirements/ /app/requirements/

RUN pip install -r $requirements && \
        python manage.py collectstatic --noinput

EXPOSE 8001

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
