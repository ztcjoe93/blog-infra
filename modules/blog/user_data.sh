#!/bin/sh

echo "Installing git..."
yum install -y git
echo "Git installation complete"

# setting up golang
echo "Installing golang..."
wget https://go.dev/dl/go${go_version}.linux-arm64.tar.gz
tar -zxf go${go_version}.linux-arm64.tar.gz
mv go /usr/local
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
rm go${go_version}.linux-arm64.tar.gz
echo "Golang installation complete"

# setting up hugo
echo "Installing hugo..."
wget https://github.com/gohugoio/hugo/releases/download/v0.119.0/hugo_extended_0.119.0_linux-arm64.tar.gz
tar -zxf hugo_extended_0.119.0_linux-arm64.tar.gz
mv hugo /usr/bin
rm hugo_extended_0.119.0_linux-arm64.tar.gz
echo "Hugo installation complete"

# setting up twc root folder
echo "Setting up twc..."
cd /opt
git clone https://github.com/ztcjoe93/blog.git
cd blog
mkdir public
hugo
echo "twc setup completed"

# setting up nginx
echo "Installing nginx..."
yum install -y nginx
sed -i 's/\/usr\/share\/nginx\/html/\/opt\/blog\/public\//' /etc/nginx/nginx.conf
systemctl start nginx
systemctl enable nginx
echo "Nginx installation complete"
