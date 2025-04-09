#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y git curl

#Install nodejs and npm
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
# 4. Install Node.js (includes npm)
sudo apt install -y nodejs

#install pm2 globally
sudo npm install -g pm2

#makedir /var/www/app
sudo mkdir -p  /var/www/app
cd /var/www/app

#clonig repo
git clone https://github.com/Maruti2307/aws-three-tier-web-architecture-workshop.git
cd aws-three-tree-tier-applicationcode

#install app teir dependencies and start app tier services
cd app-tier
sudo npm install
sudo pm2 start index.js --name app-tier

#move to web-tier install the dependencies andbuild the app 
cd ../web-tier
sudo npm install
sudo npm run build

#service we app using the Nginx 
sudo apt-get install -y nginx
sudo tee /etc/nginx/sites-availble/defualt > dev/null <<EOL
server {
listen 80 
    listen 80;
    server_name localhost;

    root /var/www/app/aws-three-tier-web-architecture-workshop/web-tier/build;
    index index.html index.htm;

    location / {
        try_files \$uri /index.html;
    }
}
EOL

# Restart Nginx to apply changes
sudo systemctl restart nginx