# docker-oraclepython
Inspired by [valudio/docker-python-flask-oracle](https://github.com/valudio/docker-python-flask-oracle)  
This docker image serves as an environment to execute python scripts with oracle database connection.

## build
```bash
docker build -t web .
```
or
```bash
docker-compose build
```

## run
```bash
docker run -d -p 8080:8080 --name web -v <host-absolute-path>:/opt/data/api web
```
or
```bash
docker-compose up
```


