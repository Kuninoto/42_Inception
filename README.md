# Inception (42Porto - 42Cursus) <img src="https://github.com/devicons/devicon/blob/master/icons/bash/bash-original.svg" title="Bash" alt="Bash Logo" width="50" height="60" align="right" />&nbsp; <img src="https://github.com/devicons/devicon/blob/master/icons/linux/linux-original.svg" title="Linux" alt="Linux Logo" width="50" height="60" align="right" />&nbsp; <img src="https://github.com/devicons/devicon/blob/master/icons/docker/docker-original.svg" title="Docker" alt="Docker Logo" width="70" height="70" align="right" />&nbsp;

## Grade: ?/100

### Subject (v1.3): [Inception en_subject](./extras/en.subject_inception.pdf)  

### Useful links:  

**What is Docker?**  
[Wikipedia](https://en.wikipedia.org/wiki/Docker_(software))  
[Docker in 100 seconds](https://www.youtube.com/watch?v=Gjnup-PuquQ)  
[What is Docker in 5 minutes](https://www.youtube.com/watch?v=_dfLOzuIg2o)  
[Introduction to Docker and Docker Containers](https://www.youtube.com/watch?v=JSLpG_spOBM)  
[Docker explained simply](https://www.youtube.com/watch?v=_trJf3GbZXg)  
[Learn Docker in 7 easy steps](https://www.youtube.com/watch?v=gAkwW2tuIqE)  

**Virtual Machines vs. Containers**  
https://www.youtube.com/watch?v=eyNBf1sqdBQ  
https://www.youtube.com/watch?v=cjXI-yxqGTI  

**What is a Daemon?**  
[Wikipedia](https://en.wikipedia.org/wiki/Daemon_(computing))  
[What is a daemon?](https://www.techtarget.com/whatis/definition/daemon)  

**Docker Official Documentation**  
[Docker docs](https://docs.docker.com/get-started/overview/)  
[Get started with Docker](https://docs.docker.com/get-started/)  

**Dockerfile**  
[Dockerfile Docs](https://docs.docker.com/engine/reference/builder/)  
[RUN vs CMD vs ENTRYPOINT](https://www.geeksforgeeks.org/difference-between-run-vs-cmd-vs-entrypoint-docker-commands/)  
[COPY | Getting Your Own Code in a Docker Container | Beginner's Tutorial](https://www.youtube.com/watch?v=rI6mrsjFHII)  

**Docker Volumes**
[Official Docs](https://docs.docker.com/storage/volumes/)  
[CLI](https://docs.docker.com/engine/reference/commandline/volume_create/)  
[What are Docker volumes and how do you use them?](https://www.howtogeek.com/devops/what-are-docker-volumes-and-how-do-you-use-them/)  
[Basics of Docker Volumes | Tutorial](https://www.youtube.com/watch?v=utbuNtqlLh0)  
[Docker Volumes explained in 6m](https://www.youtube.com/watch?v=p2PH_YPCsis)  
[Docker Volumes | Use Local Folders and Directories](https://www.youtube.com/watch?v=ex4XMet78q8)  
[Docker Volumes Explained (PostgreSQL example)](https://www.youtube.com/watch?v=G-5c25DYnfI)  
[Docker Volumes with Persistent Data in Containers | Beginners Tutorial](https://www.youtube.com/watch?v=OrQLrqQm4M0)  

**Docker Networking**
[Tutorial, all network types explained](https://www.youtube.com/watch?v=5grbXvV_DSk)  
[40min video](https://www.youtube.com/watch?v=bKFMS5C4CG0)  
[Bridge Networks](https://docs.docker.com/network/bridge/)  

**Docker Compose File**
[Official Docs](https://docs.docker.com/compose/)  
[Reference](https://docs.docker.com/engine/reference/commandline/compose/)  
[20m Tutorial](https://www.youtube.com/watch?v=qH4ZKfwbO8w)  
[30m Tutorial](https://www.youtube.com/watch?v=HG6yIjZapSA)  
[Docker Compose in 12m](https://www.youtube.com/watch?v=Qw9zlE3t8Ko)  
[Docker Compose restart policies](https://www.baeldung.com/ops/docker-compose-restart-policies)  
[Env File](https://docs.docker.com/compose/environment-variables/env-file/)  
[Volumes top-level element](https://docs.docker.com/compose/compose-file/07-volumes/)  
[Networks top-level element](https://docs.docker.com/compose/compose-file/06-networks/)  
[Services top-level element](https://docs.docker.com/compose/compose-file/05-services/)  

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
`docker system prune` - Hard cleanup of the Docker environment (stopped containers, unused networks, dangling images and build cache)  

**What is Nginx?**  
[Wikipedia](https://en.wikipedia.org/wiki/Nginx)  

**Nginx configuration**  
[Nginx config files](https://www.digitalocean.com/community/tutorials/understanding-the-nginx-configuration-file-structure-and-configuration-contexts)  
[Learn Proper Nginx Configuration Context Logic](https://www.youtube.com/watch?v=C5kMgshNc6g)  

**What is TLS?**  
[Wikipedia](https://en.wikipedia.org/wiki/Transport_Layer_Security)  

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
[wp-cli](https://make.wordpress.org/cli/handbook/guides/installing/)  

**General**  
[How to install Linux, Nginx, MariaDB, PHP (LEMP stack) on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10)  
[How Docker really works under the hood](https://www.youtube.com/watch?v=-YnMr1lj4Z8)  

---
Made by Nuno Carvalho (Kuninoto) | nnuno-ca@student.42porto.com  
<div id="badge"> <a href="https://www.linkedin.com/in/nuno-carvalho-218822247"/> <img src="https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"/>&nbsp;
