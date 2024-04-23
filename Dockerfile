FROM python:3.9.19

RUN pip install django python-dotenv psycopg2-binary crispy-bootstrap5 Pillow gunicorn dj-database-url whitenoise

RUN groupadd -g 1000 kostif
RUN useradd --uid 1000 --gid 1000 kostif

USER kostif

COPY --chown=kostif:kostif edenthought /app 

WORKDIR /app/edenthought

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
