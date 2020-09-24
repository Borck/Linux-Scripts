# #!/bin/sh -

# # mariaDB server
# sudo apt -y install mariadb-server
# sudo systemctl start mariadb
# sudo systemctl enable mariadb

# # webserver
# sudo apt install -y lighttpd
# sudo systemctl start lighttpd

# # firewall
# sudo ufw allow http
# sudo ufw allow https
# sudo ufw reload
# sudo ufw enable

# # enable webserver
# sudo systemctl enable lighttpd

# # PHP - FPM
# sudo apt install -y php-fpm php-mysql php-cli

# sed -i 's/cgi.fix_pathinfo=.*/cgi.fix_pathinfo=1/g' /etc/php/7.2/fpm/php.ini
# sed -i 's/listen = \/run\/php\/php.*-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/7.2/fpm/pool.d/www.conf

# systemctl restart php7.2-fpm

# tbc
# https://hostadvice.com/how-to/how-to-install-the-llmp-stack-on-ubuntu-18-04-vps-server-or-dedicated-server/