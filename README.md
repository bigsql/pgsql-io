# README for BigSQL ( http://lab.lussier.io ) #

# EL8 Development Environment setup

```
YUM="sudo yum -y"
$YUM update

$YUM install git
git config --global user.name "Denis Lussier"
git config --global user.email "denis@lussier.io"
git config --global push.default simple

$YUM install python3 python3-pip

sudo pip3 install awscli

$YUM install net-tools zip unix2dos wget bzip2 \
  java-1.8.0-openjdk java-1.8.0-openjdk-devel

$YUM groupinstall 'Development Tools'

$YUM install readline-devel zlib-devel openssl-devel \
  libxml2-devel libxslt-devel sqlite-devel \
  pam-devel openldap-devel python3-devel \
  unixODBC-devel llvm-devel clang-devel chrpath \
  docbook-dtds docbook-style-xsl cmake \
  perl-ExtUtils-Embed libevent-devel postgresql-devel

sudo mkdir /opt/pgbin-build
sudo chmod 777 /opt/pgbin-build
sudo chown $USER:$USER /opt/pgbin-build
mkdir /opt/pgbin-build/pgbin
mkdir /opt/pgbin-build/pgbin/bin
sudo mkdir /opt/pgcomponent
sudo chmod 777 /opt/pgcomponent
sudo chown $USER:$USER /opt/pgcomponent

mkdir ~/dev
cd ~/dev
mkdir in
mkdir out
mkdir dpg_history

# edit your ~/.bashrc to set env variables
export DEV=$HOME/dev
export HIST=$DEV/dpg_history
export IN=$DEV/in
export OUT=$DEV/out

export DPG=$DEV/dpg
export DEVEL=$DPG/devel
export PG=$DEVEL/pg
export PGBIN=$DEVEL/pgbin

export SRC=$IN/sources
export BLD=/opt/pgbin-build/pgbin/bin

export CLI=$DPG/cli/scripts
export PSX=$DPG/out/posix
export REPO=http://localhost:8000

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
export PATH=$PATH:$JAVA_HOME/bin

####################################
cd $BLD
cp -p $DPG/devel/pgbin/build/* .

cd ~
mkdir .aws
cd .aws
vi config
chmod 600 config

cd $IN
cp $DPG/devel/util/pull-s3.sh .
./pull-s3.sh
chmod 755 *.sh

```

