#!/usr/bin/env bash

MODULE=$(dirname $(readlink -f $0))
OPERATION_TYPE=$(cat $MODULE/../germ/group_vars/all.yml | awk -F : '/operation_type/{gsub(/ /,"",$2);print $2}')

case "$OPERATION_TYPE" in
    "k8s_deploy")
        bash tools/init.sh k8s
        cd $MODULE/../germ && ansible-playbook kubernetes/site.yml -e @kubernetes/etc/germ.yml
        ;;
    "k8s_decrease")
        cd $MODULE/../germ && ansible-playbook kubernetes/site.yml -e @kubernetes/etc/decrease.yml
        ;;
    "k8s_scale")
        cd $MODULE/../germ && ansible-playbook kubernetes/site.yml -e @kubernetes/etc/scale.yml
        ;;
    "k8s_upgrade")
        cd $MODULE/../germ && ansible-playbook kubernetes/site.yml -e @kubernetes/etc/upgrade.yml
        ;;
    "openstack_deploy")
        bash tools/init.sh k8s
        cd $MODULE/../germ && ansible-playbook kubernetes/site.yml -e @openstack/etc/germ.yml
        ;;
    "openstack_decrease")
        cd $MODULE/../germ && ansible-playbook kubernetes/site.yml -e @openstack/etc/decrease.yml
        ;;
    "openstack_scale")
        cd $MODULE/../germ && ansible-playbook kubernetes/site.yml -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade")
        cd $MODULE/../germ && ansible-playbook kubernetes/site.yml -e @openstack/etc/upgrade.yml
        ;;
    *)
        exit 1
        ;;
esac

