FROM ubuntu
RUN apt-get update
RUN apt-get install -y libev4 libev-dev python git wget telnet python-dev python-pip python-virtualenv unzip nginx curl
RUN pip install -U pip setuptools
RUN pip install honcho gevent cassandra-driver
RUN pip install tornado

WORKDIR /root
RUN wget https://dl.bintray.com/mitchellh/consul/0.5.1_linux_amd64.zip
RUN wget https://dl.bintray.com/mitchellh/consul/0.5.1_web_ui.zip

WORKDIR /usr/local/bin
RUN unzip /root/0.5.1_linux_amd64.zip

RUN mkdir /opt/consul_ui
WORKDIR /opt/consul_ui
RUN unzip /root/0.5.1_web_ui.zip

WORKDIR /root

RUN pip install python-consul
RUN pip install git+https://github.com/val314159/nsq2-py

EXPOSE 8088
EXPOSE 6500
EXPOSE 6600
EXPOSE 8500
EXPOSE 8800
EXPOSE 80

ADD consul.conf /etc/nginx/conf.d/consul.conf
ADD app.py app.py
ADD gapp.py gapp.py
ADD Procfile Procfile

CMD honcho start

RUN pip install gunicorn
#RUN apt-get install -y ipython ipython-doc ipython-notebook ipython-qtconsole python-matplotlib python-numpy python-zmq python-pexpect-doc

CMD gunicorn gapp:app -k gevent --log-file -
