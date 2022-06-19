#!/bin/bash

mkdir docker
mkdir docker/templates
mkdir docker/static

cp lambdas/web_app.py docker/.
cp -r lambdas/templates/* docker/templates
cp -r lambdas/static/* docker/static/.

echo "FROM python" >> Dockerfile
echo "RUN pip install flask" >> Dockerfile
echo "COPY ./docker/static /home/myapp/static/" >> Dockerfile
echo "COPY ./docker/templates /home/myapp/templates/" >> Dockerfile
echo "COPY ./lambdas/web_app.py /home/myapp/" >> Dockerfile
echo "EXPOSE 5050" >> Dockerfile
echo "CMD python /home/myapp/web_app.py" >> Dockerfile

#cd docker

#docker build -t orderbird-demo .
#docker run -t -d -p 5050:5050 --name orderbirdwebapp orderbird-demo
#docker ps -a
