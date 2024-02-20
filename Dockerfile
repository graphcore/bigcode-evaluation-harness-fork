FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3 python3-pip

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

RUN test -f /app/generations.json && rm /app/generations.json || true

RUN pip3 install .

CMD ["python3", "main.py"]
