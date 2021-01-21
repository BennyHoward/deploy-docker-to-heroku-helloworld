FROM python:3.8-buster

COPY ./index.html /index.html

# $PORT is set by Heroku
CMD python -m http.server $PORT
