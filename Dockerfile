FROM python:3
ENV PYTHONUNBUFFERED=1

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install curl
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
RUN npm install yarn

RUN mkdir /code

WORKDIR /code

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY . /code/

RUN npm install
