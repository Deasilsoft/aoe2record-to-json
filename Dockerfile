FROM python:alpine
RUN apk update \
 && apk upgrade \
 && apk add build-base

# UPGRADE PIP
RUN python -m pip install --upgrade pip

# SET ENVIRONMENT VARIABLES
ENV HOME=/home/a2j
ENV DEBUG=TRUE

# SETUP WORK DIRECTORY
WORKDIR ${HOME}
ADD . $HOME

# INSTALL PYTHON REQUIREMENTS; CACHE IT
RUN --mount=type=cache,target=.cache/pip pip install -r requirements.txt

# EXPOSE PORT
EXPOSE 8080

# RUN SERVER
CMD python app.py
