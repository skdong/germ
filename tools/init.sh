#!/usr/bin/env bash

MODULE=$(dirname $(readlink -f $0))

python $MODULE/generate_passwords.py -p $MODULE/../etc/germ/passwords.yml

ansible-playbook $MODULE/init.yml
chmod 0600 $MODULE/../etc/germ/id_rsa

if [ "$1"x = "k8s"x ] ;then
    cp $MODULE/../germ/ansible-k8s.cfg $MODULE/../germ/ansible.cfg
else
    cp $MODULE/../germ/ansible-openstack.cfg $MODULE/../germ/ansible.cfg
fi
