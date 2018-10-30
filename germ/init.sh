#/usr/bin/env bash
ansible-playbook -e @../etc/kolla/globals.yml sit.yml -t cluster $*
