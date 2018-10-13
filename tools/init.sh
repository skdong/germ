#!/usr/bin/env bash

MODULE=$(dirname $(readlink -f $0))

python $MODULE/generate_passwords.py -f $MODULE/../etc/kolla/passwords.yml

ansible-playbook $MODULE/init.yml
