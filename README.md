# Inception (42Porto - 42Cursus) <img src="https://github.com/devicons/devicon/blob/master/icons/bash/bash-original.svg" title="Bash" alt="Bash Logo" width="50" height="60" align="right" />&nbsp; <img src="https://github.com/devicons/devicon/blob/master/icons/linux/linux-original.svg" title="Linux" alt="Linux Logo" width="50" height="60" align="right" />&nbsp; <img src="https://github.com/devicons/devicon/blob/master/icons/docker/docker-original.svg" title="Docker" alt="Docker Logo" width="70" height="70" align="right" />&nbsp;

## Grade: ?/100

### Subject (v1.3): [Inception en_subject](./extras/en.subject_inception.pdf)  

### Useful links: 
**What is Docker?**  
[Wikipedia](https://en.wikipedia.org/wiki/Docker_(software))  
[Docker in 100 seconds](https://www.youtube.com/watch?v=Gjnup-PuquQ)  
[What is Docker in 5 minutes](https://www.youtube.com/watch?v=_dfLOzuIg2o)  
[Introduction to Docker and Docker Containers](https://www.youtube.com/watch?v=JSLpG_spOBM)  

**Learning Docker**  
[Learn Docker in 7 easy steps](https://www.youtube.com/watch?v=gAkwW2tuIqE)
[Docker networking](https://www.youtube.com/watch?v=bKFMS5C4CG0)  

**Virtual Machines vs. Containers**  
https://www.youtube.com/watch?v=eyNBf1sqdBQ  
https://www.youtube.com/watch?v=cjXI-yxqGTI  

**Dockerfile**  
[Dockerfile Docs](https://docs.docker.com/engine/reference/builder/)  
[RUN vs CMD vs ENTRYPOINT](https://www.geeksforgeeks.org/difference-between-run-vs-cmd-vs-entrypoint-docker-commands/)


**Docker-Compose File**
[Docker Compose restart policies](https://www.baeldung.com/ops/docker-compose-restart-policies)  

**What is a Daemon?**  
[Daemon Wikipedia](https://en.wikipedia.org/wiki/Daemon_(computing))  
[What is a daemon?](https://www.techtarget.com/whatis/definition/daemon)

**Docker Official Documentation**  
[Docker docs](https://docs.docker.com/get-started/overview/)  
[Get started with Docker](https://docs.docker.com/get-started/)

**Useful Docker commands**  
`docker pull` - Pull a Docker image from a registry, such as [Docker Hub](https://hub.docker.com/)  
`docker push` - Push a Docker image to a registry  
`docker build` - Build a Docker image from a Dockerfile  
`docker build -t <image_name>` - Build a Docker image, named _<image_name>_ from a Dockerfile    
`docker run` - Run a container based on a Docker image  
`docker stop` - Stop a running container  
`docker ps` - List the running containers  
`docker ps -a` - List all running and non-running containers  
`docker ps -l` - List the last created container
`docker ps -aq` - List all containers ID's  
`docker images` - List all the top level images, their repositories and their sizes  
`docker images -q` - List all images ID's  
`docker rm` - Remove a container  
`docker rm $(docker ps -aq)` - Remove all containers  
`docker rmi` - Remove a Docker image  
`docker rmi $(docker images -q)` - Remove all Docker images
`docker exec` - Execute a command in a running container  
`docker exec -it <container_name_or_id> /bin/bash` - Spawns a bash session inside the container that we can access  
`docker logs` - Display the logs of a container  
`docker inspect` - Provides detailed information about a container  
`docker run -d -p <port>:<mapped_port> --name <container_name> <image_name>` - Runs a container from _<image_name>_ Docker Image in detach mode with _<container_name>_ name and port mapping port -> mapped_port  

**What is Nginx?**  
[Nginx Software](https://en.wikipedia.org/wiki/Nginx)  

**Nginx configuration**  
[Nginx config files](https://www.digitalocean.com/community/tutorials/understanding-the-nginx-configuration-file-structure-and-configuration-contexts)  
[Learn Proper Nginx Configuration Context Logic](https://www.youtube.com/watch?v=C5kMgshNc6g)  

**What is TLS?**  
[Definition](https://en.wikipedia.org/wiki/Transport_Layer_Security)  

**What is SSL?**  
[Definition](https://www.cloudflare.com/learning/ssl/what-is-ssl/)  

**Configuring Nginx for TLS**  
[How to properly configure your Nginx for TLS](https://medium.com/@mvuksano/how-to-properly-configure-your-nginx-for-tls-564651438fe0)  
Generating a self-signed certificate  
    - https://www.baeldung.com/openssl-self-signed-cert  
    - https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl  


**MariaDB**  
[Introduction](https://www.redhat.com/sysadmin/mysql-mariadb-introduction)  

**WordPress**  
[Installing WordPress with LEMP stack](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-nginx-mariadb-and-php-on-debian-10#step-4-downloading-wordpress)  

[How to install Linux, Nginx, MariaDB, PHP (LEMP stack) on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10)  

---
Made by Nuno Carvalho (Kuninoto) | nnuno-ca@student.42porto.com  
<div id="badge"> <a href="https://www.linkedin.com/in/nuno-carvalho-218822247"/> <img src="https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"/>&nbsp;
