# INSTALL PYTHON IMAGE
FROM python:3.6.8

# INSTALL TOOLS
RUN apt-get update \
    && apt-get -y install unzip \
    && apt-get -y install libaio-dev \
    && mkdir -p /opt/data/api


ADD ./oracle-instantclient/ /opt/data
ADD ./prepare-env.sh /opt/data
ADD ./requirements.txt /opt/data

WORKDIR /opt/data

ENV ORACLE_HOME=/opt/oracle/instantclient
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME

ENV OCI_HOME=/opt/oracle/instantclient
ENV OCI_LIB_DIR=/opt/oracle/instantclient
ENV OCI_INCLUDE_DIR=/opt/oracle/instantclient/sdk/include

# INSTALL INSTANT CLIENT AND DEPENDENCIES
RUN ["/bin/bash","./prepare-env.sh"]
RUN pip install -r requirements.txt

COPY . .
CMD ["python","app.py"]