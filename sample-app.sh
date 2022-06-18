#!/bin/bash

mkdir docker_container
mkdir docker_container/templates
mkdir docker_container/static

cp lambdas/web_app.py docker_container/.
cp -r lambdas/templates/* docker_container/templates
cp -r lambdas/static/* docker_container/static/.

echo "FROM python" >> docker_container/Dockerfile
echo "RUN pip install -r all_requirements.txt" >>docker_container/Dockerfile
echo "COPY ./static /home/myapp/static/" >> docker_container/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> docker_container/Dockerfile
echo "COPY web_app.py /home/myapp/" >>docker_container/Dockerfile

echo "EXPOSE 5050" >> docker_container/Dockerfile
echo "CMD python /home/myapp/web_app.py" >> docker_container/Dockerfile

cd docker_container

docker build -t orderbird-demo .
docker run -t -d -p 5050:5050 --name orderbirdwebapp orderbird
docker ps -a
