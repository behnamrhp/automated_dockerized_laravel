# Dockerized vira system

### Folder Structuring
- `nginx` : in this folder and in default.conf file we define nginx load balancing configs 
- `vira_db` : this folder is volume for mysql image for persisting its data
- `vira_dockerized_app` : this folder is volume of main app and you can modify this folder in development mode.

---

### how to run

- `development`: running in development mode we use docker-compose.dev.yml and docker-compose.yml as well as Dockerfile. use following code in command line:

```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d 
```

- `production` : 

```bash 
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```


> note : if you wanna rebuild Dockerfile you can add `--build` in the end of commands

> note : if you wanna stop the runnig dockerized system use `down` instead of `up`


### deploy with swarm

`steps`: 

 1. on ubuntu server we should install docker from below link:
 > https://docs.docker.com/engine/install/ubuntu/

> note: if you want to install docker-compose use following link:
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04

2. login to your docker hub account
```bash 
docker login
```
3. clone the image with git

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

### update the deployed app
on local machin enter this commands on CD pipline :
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml build
docker-compose -f docker-compose.yml -f docker-compose.dev.yml push `IMAGE NAME`
```

then on server you can run following command 
```bash 
docker stack deploy --with-registry-auth  -c `YOUR DOCKER COMPOSE FILE` `DOCKER SWARM NAME`
```

if docker swarm couldn't reach the docker hub account pull the image manualy and then run above command again