# Automation and Dockerization of Laravel Project

a basic project for your initial using of dockerized and automated laravel ^8.0 projects

## Techs : 
  1. laravel 8.0
  2. mysql
  3. nginx
  4. docker
  5. docker-swarm
  6. docker-compose
  7. github actions

## Features :
  1. in this project we used nginx for load balancing and reverse proxy with basic configs
  2. two version of docker-compose file for development and production mode
  3. we set configs for docker swarm basic configs
  4. github actions workflow for test and deploy for build and push docker image to you dockerhub 


### Folder Structuring
- [`nginx`](./nginx/) : in this folder and in default.conf file we define nginx load balancing configs 
- [`db`](./db/) : this folder is volume for mysql image for persisting its data
- [`app`](./app/) : this folder is volume of main app and you can modify this folder in development mode.

---

### How to run

- `development`: running in development mode we use docker-compose.dev.yml and docker-compose.yml. use following code in command line:

```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d 
```

- `production` : 

```bash 
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```


> note : if you wanna rebuild Dockerfile you can add `--build` in the end of commands

> note : if you wanna stop the runnig dockerized system use `down` instead of `up`


### Deploy with swarm

`steps`: 

 1. For install the docker on ubuntu server use following link:
 > [DockerDoc](https://docs.docker.com/engine/install/ubuntu/)

> note: if you wanna install docker-compose use following link:
\
[digitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)

2. login to your docker hub account
```bash 
docker login
```
3. clone the repo with git

4. init the docker swarm with: 
```bash 
docker swarm init --advertise-addr `YOUR IP`
```

this command will make manager node that can handle the containers

5. use following command to start deploying:
```bash 
docker stack deploy --with-registry-auth  -c `YOUR DOCKER COMPOSE FILE` `DOCKER SWARM NAME`
```

if it has not pull the image from docker hub you can pull the image manualy
```bash
docker pull `IMAGE NAME`
```
