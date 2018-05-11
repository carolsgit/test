关闭iptables和selinux


#！/bin/bash
#关闭iptables和selinux


#iptables stop
/etc/init.d/iptables stop
/sbin/chkconfig iptables off


#selinux stop
sed  -i.ori s#^SELINUX=enforcing#SELINUX=disabled#g' /etc/selinux/config 
sleep 1
setenforce 0
sleep 1
getenforce






