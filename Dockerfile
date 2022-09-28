FROM python:alpine3.16

ARG retention-days
WORKDIR /app

COPY src .

RUN pip install -r requirements.txt

ENTRYPOINT [ "python","/app/main.py" ]