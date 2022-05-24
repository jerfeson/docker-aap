#!/usr/bin/env bash
# Create symlink to customizable conf for virtual hosts
ln -s /var/www/html/virtualhosts.conf /etc/httpd/conf.d/virtualhosts.conf
systemctl start httpd