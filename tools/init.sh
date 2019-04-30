#!/usr/bin/env bash

MODULE=$(dirname $(readlink -f $0))

python $MODULE/generate_passwords.py -p $MODULE/../etc/germ/passwords.yml
case "$1" in
    "k8s")
        cp $MODULE/../germ/ansible-k8s.cfg $MODULE/../germ/ansible.cfg
        ansible-playbook $MODULE/init.yml -e germ_path=$MODULE/..
        ;;
    "openstack")
        cp $MODULE/../germ/ansible-openstack.cfg $MODULE/../germ/ansible.cfg
        ansible-playbook $MODULE/init.yml -e germ_path=$MODULE/..
        cd $MODULE/../germ/ && ansible-playbook openstack/post-play.yml -e @openstack/etc/germ.yml
        ;;
    *)
        echo "Parameter error.For example: k8s or openstack"
        exit 1
        ;;
esac

#ansible-playbook $MODULE/init.yml -e germ_path=$MODULE/..
chmod 0600 $MODULE/../etc/germ/id_rsa

