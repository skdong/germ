#!/usr/bin/env bash

MODULE=$(dirname $(readlink -f $0))

case "$1" in
    "k8s")
        cp $MODULE/../germ/ansible-k8s.cfg $MODULE/../germ/ansible.cfg
        ;;
    "openstack")
        cp $MODULE/../germ/ansible-openstack.cfg $MODULE/../germ/ansible.cfg
        ;;
    *)
        echo "Parameter error.For example: k8s or openstack"
        exit 1
        ;;
esac

python $MODULE/generate_passwords.py -p $MODULE/../etc/germ/passwords.yml

ansible-playbook $MODULE/init.yml -e germ_path=$MODULE/..
chmod 0600 $MODULE/../etc/germ/id_rsa

