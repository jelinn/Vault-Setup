
#Install updates and SSH Server
sudo apt update && sudo apt upgrade
sudo apt install openssh-server

#Download and install the latest version of Vault Enterprise
wget https://releases.hashicorp.com/vault/1.6.0+ent/vault_1.6.0+ent_linux_amd64.zip
unzip vault_1.6.0+ent_linux_amd64.zip
chown root:root vault
mv vault /usr/local/bin

#Add Vault user 
useradd --system --home /etc/vault.d --shell /bin/false vault

#Create config directory copy sample config
mkdir --parents /etc/vault.d
cp /files/vault.hcl /etc/vault.d/vault.hcl

#Create directory for Raft Integrated Storage. 
mkdir /opt/raft
chown -R vault:vault /opt/raft

#Copy the service file to systemd settings
cp /files/vault.service /etc/systemd/system/vault.service

#Enable and start the Vault service
systemctl enable vault
systemctl start vault
systemctl status vault


