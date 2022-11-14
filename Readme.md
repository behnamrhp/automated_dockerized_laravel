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
