#!/usr/bin/env bash

MODULE=$(dirname $(readlink -f $0))

python $MODULE/generate_passwords.py -p $MODULE/../etc/germ/passwords.yml

ansible-playbook $MODULE/init.yml
chmod 0600 $MODULE/../etc/germ/id_rsa
if ["$1" = "k8s" ] ;then
    mv -f ../germ/ansible-k8s.cfg ../germ/ansible.cfg
else
    mv -f ../germ/ansible-openstack.cfg ../germ/ansible.cfg
fi