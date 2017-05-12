# User environment
echo "Updating environment"
if [ $(grep -c "# Custom PS1" $PROFILE) -eq 0 ]; then
    echo -e ${SH_PS1} >> ${PROFILE}
fi

# Postgresql related
echo "Installing Postgresql"
echo "Fixing listen_addresses on postgresql.conf"
sudo sed -i "s/#listen_address.*/listen_addresses '*'/" ${PG_CONFIG}
echo "Fixing postgres pg_hba.conf file"
# replace the ipv4 host line with the above line
if [ $(grep -c "\# Fixed:" $PG_HBA_CONF) -eq 0 ]; then
    sudo cat >> $PG_HBA_CONF <<EOF
# Fixed: Accept all IPv4 connections - FOR DEVELOPMENT ONLY!!!
host    all         all         0.0.0.0/0             md5
EOF
fi
if sudo -u postgres psql -c "\du ${DBUSER}" | grep -qw ${DBUSER}; then
	echo "Creating role: PostgreSQL user ${DBUSER} already exists"
else
    echo "Creating role: ${DBUSER}"
    sudo su postgres -c "createuser --no-password --superuser ${DBUSER}"
fi
# Create Database
if sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw ${DBNAME}; then
	echo "Creating database: PostgreSQL database '${DBNAME}' already exists"
else
    echo "Creating database: '${DBNAME}'."
    sudo su postgres -c "createdb -E UTF8 -T template0 --locale=en_US.utf8 -O ${DBUSER} ${DBNAME}"
fi
echo "Installing Node"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install -y nodejs

# Set the path of node_modules to home dir
npm config set prefix /home/vagrant/npm
echo -e 'export PATH=/home/vagrant/npm/bin:$PATH\n' >> ${PROFILE}

exit 0
