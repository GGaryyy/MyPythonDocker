# Use Ubuntu:20.04 image as parent image
FROM ubuntu:20.04

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN apt-get update
RUN apt-get -y install git curl zip
RUN apt-get -y install python3-pip python3-dev
RUN apt-get -y install build-essential libssl-dev libffi-dev
RUN pip install --no-cache-dir -r requirements.txt
RUN ln -s /usr/bin/python3 /usr/bin/python 

# RUN ln -s /usr/bin/python3 /usr/bin/python -> 
# Ubuntu 20.04 默認不將 python 命令連接到 Python 3，因为 Python 2 和 Python 3 同時存在，
# 增加這行來讓進行連接，這邊就指定以python3來做運行。


CMD [ "python" ]