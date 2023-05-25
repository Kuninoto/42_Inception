# sudo useradd --create-home --password plsdonthackme123 nnuno-ca

sudo apt-get update -yq

sudo apt-get install -yq ca-certificates curl gnupg

# Add Docker’s official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set up the repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -yq

# Install Docker, Docker-Compose and Makefile
sudo apt-get install -yq docker-ce\
                         docker-ce-cli\
                         containerd.io\
                         docker-buildx-plugin\
                         docker-compose-plugin\
                         docker-compose\
                         make

# Check if both Docker and Docker-Compose were correctly installed
if [[ -x $(command -v "docker") && -x $(command -v "docker-compose") ]]; then
    echo "Docker and Docker-Compose successfully installed!"
    docker --version
    docker-compose --version
else
    echo "ERROR: Docker or Docker-Compose installation failed!"
fi

# Allow non-root users to run Docker
sudo chmod 666 /var/run/docker.sock

# Create expected directories for the Docker volumes
mkdir -p /home/nnuno-ca/data;
mkdir -p /home/nnuno-ca/data/mariadb_data /home/nnuno-ca/data/wordpress_data

# Request NGINX
# curl --insecure -i https://localhost:443
