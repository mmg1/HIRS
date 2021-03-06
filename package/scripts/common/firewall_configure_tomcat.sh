CENTOS_VER=`/opt/hirs/scripts/common/get_centos_major_version.sh`

if [ $CENTOS_VER -eq "6" ] ; then
	checkHTTPS=`iptables-save | grep -- "--dport 8443 -j ACCEPT"`
	if [[ $checkHTTPS == "" ]]; then
	    echo "Tomcat HTTPS firewall rule doesn't exist, adding now"
	    sudo iptables -I INPUT 1 -p tcp -m tcp --dport 8443 -j ACCEPT
	    service iptables save
	fi
elif [ $CENTOS_VER -eq "7" ] ; then
	sudo firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 0 -p tcp --dport 8443 -j ACCEPT
	sudo firewall-cmd --reload
else
	echo "Unsupported CentOS version: ${CENTOS_VER}"
	exit 1
fi