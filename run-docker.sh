#!/bin/bash

mkdir docker
mkdir docker/templates
mkdir docker/static

cp lambdas/web_app.py docker/.
cp -r lambdas/templates/* docker/templates
cp -r lambdas/static/* docker/static/.

echo "FROM python" >> docker/Dockerfile
echo "RUN pip install flask" >>docker/Dockerfile
echo "COPY ./static /home/myapp/static/" >> docker/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> docker/Dockerfile
echo "COPY web_app.py /home/myapp/" >>docker/Dockerfile
echo "EXPOSE 5050" >> docker/Dockerfile
echo "CMD python /home/myapp/web_app.py" >> docker/Dockerfile

cd docker

docker build -t orderbird-demo .
docker run -t -d -p 5050:5050 --name orderbirdwebapp orderbird-demo
docker ps -a
