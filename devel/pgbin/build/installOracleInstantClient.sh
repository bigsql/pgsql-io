sudo mkdir -p /opt/oracleinstantclient
sudo chown $USER:$USER /opt/oracleinstantclient

cp $IN/oracle/*.zip /opt/oracleinstantclient/.

cd /opt/oracleinstantclient
unzip instantclient-basic*.zip
unzip instantclient-sdk*.zip
unzip instantclient-sqlplus*.zip

cd $ORACLE_HOME
ln -s libclntsh.so.12.1 libclntsh.so

