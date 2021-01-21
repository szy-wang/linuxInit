#!/bin/bash
#系统初始化配置
#关闭防火墙
stopFirewalld(){
        systemctl stop firewalld
        systemctl disable firewalld
}
#关闭SELINUX
stopSelinux(){
        setenforce 0
        
}
#安装相关软件
installSoft(){
        yum install -y vim
        yum install -y wget
}
#更新yum源
updateYum(){
        mkdir /etc/yum.repos.d/bak
        mv /etc/yum.repos.d/*.repo  /etc/yum.repos.d/bak
        wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
}
main(){
	stopFirewalld
	stopSelinux
	installSoft
	updateYum
}
main
