#!/bin/bash

proxy_on(){
    proxy_off
    gsettings set org.gnome.system.proxy mode "manual"
    ciadpi -p 8081 -i 127.0.0.1 --split 1 --split 10 --split 50 --auto=torst --tlsrec 1+s -F -D
    pproxy -l http://127.0.0.1:8080  -r socks5://127.0.0.1:8081 -vv --daemon
    echo started
}

proxy_off(){
    echo offing...
    gsettings set org.gnome.system.proxy mode "manual"
    pkill ciadpi
    pkill pproxy 
    echo done
}

setup(){
    echo setting up...
    gsettings set org.gnome.system.proxy.http enabled true
    gsettings set org.gnome.system.proxy.http host 127.0.0.1
    gsettings set org.gnome.system.proxy.http port 8080
    gsettings set org.gnome.system.proxy.https host 127.0.0.1
    gsettings set org.gnome.system.proxy.https port 8080
    gsettings set org.gnome.system.proxy.socks host 127.0.0.1   
    gsettings set org.gnome.system.proxy.socks port 8081   
    echo done
}

status(){
    gsettings get org.gnome.system.proxy.http enabled 
    gsettings get org.gnome.system.proxy.http host 
    gsettings get org.gnome.system.proxy.http port 
  
    gsettings get org.gnome.system.proxy.https host 
    gsettings get org.gnome.system.proxy.https port 

    gsettings get org.gnome.system.proxy.socks host  
    gsettings get org.gnome.system.proxy.socks port   
    echo done


if [ "$#" -ne 1 ];then
    echo args?
    exit 1
fi

if [ $1 == "on" ];then 
    proxy_on
elif [ $1 == "off" ];then
    proxy_off
elif [ $1 == "setup" ];then
    setup
else
    status
fi
