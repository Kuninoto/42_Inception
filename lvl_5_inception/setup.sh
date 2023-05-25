sudo useradd nnuno-ca --no-create-home "nnuno-ca" --password "plsdonthackme123"

sudo apt update -yq && sudo apt upgrade -yq

# Install prerequisites
sudo apt install apt-transport-https\
                 ca-certificates\
                 curl\
                 software-properties-common\
                 -yq

# Add GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker && Docker-Compose
sudo apt-get install docker-ce\
                     docker-ce-cli\
                     containerd.io\
                     docker-buildx-plugin\
                     docker-compose-plugin\
                     -yq

# Check if both Docker and Docker-Compose were correctly installed
if [[ -x $(command -v "docker") && -x $(command -v "docker-compose") ]]; then
    echo "Docker and Docker-Compose successfully installed!"
    docker --version
    docker-compose --version
else
    echo "ERROR: Docker or Docker-Compose installation failed!"
fi

# Allow non-root users to run Docker
#sudo chmod 666 /var/run/docker.sock

# Create expected directories for the Docker volumes
mkdir -p /home/nnuno-ca/data;
mkdir -p /home/nnuno-ca/data/mariadb_data /home/nnuno-ca/data/wordpress_data

# Request NGINX
# curl --insecure -i https://localhost:443