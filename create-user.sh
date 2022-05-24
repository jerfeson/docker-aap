#!/usr/bin/env bash

useradd -m ec2-user

usermod -aG wheel ec2-user

sed -i "s|# %wheel	ALL=(ALL)	NOPASSWD: ALL|%wheel	ALL=(ALL)	NOPASSWD: ALL|g" /etc/sudoers