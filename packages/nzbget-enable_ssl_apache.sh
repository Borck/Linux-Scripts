#!/bin/sh -

InstallPath='/opt/nzbget'
HttpFile='/etc/apache2/sites-available/000-default.conf'
HttpsFile='/etc/apache2/sites-available/default-ssl.conf'
UrlPath='/nzbget'
IP="127.0.0.1"


if [ "$(id -u)" != "0" ]; then
	echo "You don't have sufficient privileges to run this script. Restart with root privileges."
	exit 1
fi

if [ ! -f /etc/apache2/ssl/apache.crt ]; then
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
fi

# enable https (ssl) access over port 6791
sed -i "/SecureCert=/c\SecureCert=/etc/apache2/ssl/apache.crt" ${InstallPath}/nzbget.conf
sed -i "/SecureKey=/c\SecureKey=/etc/apache2/ssl/apache.key" ${InstallPath}/nzbget.conf
sed -i "/SecureControl=/c\SecureControl=yes" ${InstallPath}/nzbget.conf




if [ ! -f ${InstallPath}'/nzbget.conf' ]; then
	echo "NZBGet was not found. Please reinstall it on default directory"${InstallPath}
	exit 1
fi

ControlPort=$(awk -F "=" '/ControlPort/ {print $2}' /opt/nzbget/nzbget.conf)
#SecurePort=$(awk -F "=" '/SecurePort/ {print $2}' /opt/nzbget/nzbget.conf)

ProxyRequestsKey='ProxyRequests'
ProxyRequestsVal='Off'
ProxyPreserveHostKey='ProxyPreserveHost'
ProxyPreserveHostVal='On'
ProxyPassKey='ProxyPass'
ProxyPassVal=${UrlPath}' http://'${IP}':'${ControlPort}${UrlPath}
RewriteRuleKey='RewriteRule'
RewriteRuleVal='^/nzbget$ /nzbget/ [R]'


#grep -q '[ \t]*option' $file && sed -i 's/^option.*/option=value/' $file || echo 'option=value' >> $file
#sed -i 's/.*</VirtualHost>.*/Cygwin\n&/' $file