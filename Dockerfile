# use a ubuntu image
FROM ubuntu:16.04

# install pip3
RUN apt update
RUN apt -y install python3-pip

#cp and cd to app
COPY . /app
WORKDIR /app

#install python env
RUN apt -y  install libpq-dev python3-dev
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade pip

#install requirements.txt
RUN pip3 install -r requirements.txt

# tell docker what port to expose
EXPOSE 5000

CMD python3 ./run.py
