yum install -y nginx
systemctl start nginx
systemctl enable nginx
git clone https://github.com/Livinstone95/ACS-project-config.git
mv /ACS-project-config/reverse.conf /etc/nginx/
cd /etc/nginx
touch nginx.conf
sed -n 'w nginx.conf' reverse.conf
systemctl restart nginx
rm -rf reverse.conf
re -rf /ACS-project-config