FROM python
RUN pip install flask
COPY ./docker/static /home/myapp/static/
COPY ./docker/templates /home/myapp/templates/
COPY ./lambdas/web_app.py /home/myapp/
EXPOSE 5050
CMD python /home/myapp/web_app.py
