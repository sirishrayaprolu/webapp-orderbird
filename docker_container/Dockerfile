FROM python
RUN pip install flask
COPY ./layers /home/myapp/
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY web_app.py /home/myapp/
EXPOSE 8080
CMD python /home/myapp/web_app.py
