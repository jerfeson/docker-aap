#!/usr/bin/env bash

systemctl stop httpd

if [ -e /var/run/httpd/httpd.pid ]
then
	rm -f /var/run/httpd/httpd.pid
fi

rm -f /var/run/httpd/*
rm -f /tmp/*

systemctl start httpd
systemctl start php-fpm