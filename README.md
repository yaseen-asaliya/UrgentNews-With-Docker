# UrgentNews-Docker-Assignment_4_Cloud_Computing
> Overall, all the base images are not from `ubuntu` directly, cause ubuntu is very big base image so i used light weight images to make images creation in best practice.

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
### Running using `docker run`
* To run database container, setup `.env_db` file then use the following command:
```
$ sudo docker run -d -p 3306:3306 --env-file .env_db --name mariadb-news-container yaseenasaliya/urgentnews-database
```
* Example of `env_db`
```
MYSQL_DATABASE=urgentNews
MYSQL_USER=yaseen
MYSQL_PASSWORD=12345
MYSQL_ROOT_PASSWORD=root
```


* To run backend container, setup `.env_backend` file then use the following command:
```
$ sudo docker run -d -p 5000:5000 --env-file .env_backend --name news-backend-container yaseenasaliya/urgentnews-backend
```
* Example of `env_backend`
```
DB_HOST=<host-ip>
DB_USER=yaseen
DB_PASS=12345
DB_NAME=urgentNews
DB_PORT=3306
```

* To run frontend container use the following command:
```
$ sudo docker run -d -p 80:80 -e HOST_IP=<host-ip> --name news-frontend-container yaseenasaliya/urgentnews-frontend
```

* Go to following url in your browser to see the result
```
http://localhost
```
### Running using `docker compose `
* Install `docker-compose` 
```
$ sudo apt install docker-compose
```
* create `docker-compose.yml` file 
```
version: '3'
services:
  mariadb-news-container:
    image: yaseenasaliya/urgentnews-database
    ports:
      - 3306:3306
    env_file: .env_db
    container_name: mariadb-news-container

  news-backend-container:
    image: yaseenasaliya/urgentnews-backend
    ports:
      - 5000:5000
    env_file: .env_backend
    container_name: news-backend-container

  news-frontend-container:
    image: yaseenasaliya/urgentnews-frontend
    ports:
      - 80:80
    environment:
      - HOST_IP=<host-ip>
    container_name: news-frontend-container
```
#### Setup environment files `.env_db` & `.env_backend`
* Example of `env_db`
```
MYSQL_DATABASE=urgentNews
MYSQL_USER=yaseen
MYSQL_PASSWORD=12345
MYSQL_ROOT_PASSWORD=root
```
* Example of `env_backend`
```
DB_HOST=<host-ip>
DB_USER=yaseen
DB_PASS=12345
DB_NAME=urgentNews
DB_PORT=3306
```

* Run docker compose file 
```
$ sudo docker-compose up -d
```
* Go to following url in your browser to see the result
```
http://localhost
```

















