#/usr/bin/env bash
ansible-playbook -i inventory/inventory.cfg -e @../etc/kolla/globals.yml -e @../etc/kolla/passwords.yml /home/kolla/dire/steam/ansible/sit.yml
