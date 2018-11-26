#/usr/bin/env bash
ansible-playbook -e @../etc/germ/globals.yml site.yml -t cluster $*
