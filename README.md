# UrgentNews-Docker-Assignment_4_Cloud_Computing
> Overall, all the base images are not from `ubuntu` directly, cause ubuntu is very big base image so i used light weight images to make images creation in best practice.
## configur images
### Createing and Building images

* The following docker file `Dockerfile.urgentNews.database` based from `maraidb` databaes image and it copy the news scritps file to the container to be executed, then expose prot `3306` for that database.
```
FROM mariadb:10.6
COPY news.sql /docker-entrypoint-initdb.d/news.sql
EXPOSE 3306
```
* The image was build using the following command:
```
$ sudo docker build -f Dockerfile.urgentNews.database -t yaseenasaliya/urgentnews-database .
```


* The following docker file `Dockerfile.urgentNews.backend` based from `python:3.9-slim-buster` which is a light weight ubuntu image, it install python3 and flask and their dependencies, then copy python code, then enrtypoint to start flask server when container is created.
```
FROM python:3.9-slim-buster
RUN apt-get update && apt-get -y install python3 python3-pip
RUN pip3 install flask mysql-connector-python python-dotenv paramiko
WORKDIR /app
COPY *py /app/
ENTRYPOINT FLASK_APP=/app/app.py flask run --host=0.0.0.0
```
* The image was build using the following command:
```
$ sudo docker build -f Dockerfile.urgentNews.database -t yaseenasaliya/urgentnews-backend .
```

* The following docker file `Dockerfile.urgentNews.frontend` based from `php` with apache version which is light weight, it install apache2 then copy frontend files into `/var/www/html` directory, it expose port 80 to run, then ron apache2 in foreground to keep container alive.
```
FROM php:7.4-apache
RUN apt-get update && apt-get -y install apache2
WORKDIR /var/www/html
COPY index.html /var/www/html/
COPY styles.css /var/www/html/
COPY script.js /var/www/html/
EXPOSE 80
CMD ["apache2-foreground"]
```
* The image was build using the following command:
```
$ docker build -f Dockerfile.urgentNews.frontend -t yaseenasaliya/urgentnews-frontend .
```


### Push images 
* First step before pushing is to login into docker hub using the following command:
```
$ sudo docker login
```
* Push Database image using the following command:
```
$ sudo docker push yaseenasaliya/urgentnews-database
```
* Push Backend image using the following command:
```
$ sudo docker push yaseenasaliya/urgentnews-backend
```
* Push Frontend image using the following command:
```
$ sudo docker push yaseenasaliya/urgentnews-frontend
```


## Running images










