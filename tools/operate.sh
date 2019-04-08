#!/usr/bin/env bash

MODULE=$(dirname $(readlink -f $0))
OPERATION_TYPE=$(cat $MODULE/../germ/group_vars/all.yml | awk -F : '/operation_type/{gsub(/ /,"",$2);print $2}')

case "$OPERATION_TYPE" in
    "k8s_deploy")
#        bash $MODULE/init.sh k8s
        cd $MODULE/../germ && ansible-playbook kubernetes/site.yml -e @kubernetes/etc/germ.yml
        ;;
    "k8s_decrease")
        cd $MODULE/../germ && ansible-playbook kubernetes/decrease.yml -e @kubernetes/etc/germ.yml
        ;;
    "k8s_scale")
        cd $MODULE/../germ && ansible-playbook kubernetes/scale.yml -e @kubernetes/etc/germ.yml
        ;;
    "k8s_upgrade_etcd")
        cd $MODULE/../germ && ansible-playbook kubernetes/upgrade.yml --tags=etcd -e @kubernetes/etc/germ.yml
        ;;
    "k8s_upgrade")
        cd $MODULE/../germ && ansible-playbook kubernetes/upgrade.yml -e @kubernetes/etc/germ.yml
        ;;
    "k8s_monitor")
        cd $MODULE/../germ && ansible-playbook kubernetes/prometheus/prometheus.yml -e @kubernetes/etc/germ.yml
        ;;
    "k8s_alert")
        cd $MODULE/../germ && ansible-playbook kubernetes/prometheus/alert.yml -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_node")
        cd $MODULE/../germ && ansible-playbook kubernetes/kubelet/recover.yml -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_etcd")
        cd $MODULE/../germ && ansible-playbook kubernetes/etcd/recover.yml -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_apiserver")
        cd $MODULE/../germ && ansible-playbook kubernetes/recover.yml --tags=apiserver -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_controller")
        cd $MODULE/../germ && ansible-playbook kubernetes/recover.yml --tags=controller -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_scheduler")
        cd $MODULE/../germ && ansible-playbook kubernetes/recover.yml --tags=scheduler -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_calico")
        cd $MODULE/../germ && ansible-playbook kubernetes/recover.yml --tags=calico -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_coredns")
        cd $MODULE/../germ && ansible-playbook kubernetes/recover.yml --tags=coredns -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_dashboard")
        cd $MODULE/../germ && ansible-playbook kubernetes/recover.yml --tags=dashboard -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_ceph_mon")
        cd $MODULE/../germ && ansible-playbook kubernetes/recover.yml --tags=ceph_mon -e @kubernetes/etc/germ.yml
        ;;
    "k8s_recover_ceph_osd")
        cd $MODULE/../germ && ansible-playbook kubernetes/recover.yml --tags=ceph_osd -e @kubernetes/etc/germ.yml
        ;;
    "openstack_deploy")
#        bash tools/init.sh k8s
        cd $MODULE/../germ && ansible-playbook openstack/site.yml -e @openstack/etc/germ.yml
        ;;
    "openstack_decrease")
        cd $MODULE/../germ && ansible-playbook openstack/decrease.yml
        ;;
    "openstack_scale")
        cd $MODULE/../germ && ansible-playbook openstack/site.yml -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_aodh")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=aodh -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_heat")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=heat -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_horizon")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=horizon -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_ceilometer")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=ceilometer -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_neutron")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=neutron -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_keystone")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=keystone -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_nova")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=nova -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_glance")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=glance -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_gnocchi")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=gnocchi -e @openstack/etc/germ.yml
        ;;
    "openstack_upgrade_cinder")
        cd $MODULE/../germ && ansible-playbook openstack/upgrade.yml --tags=cinder -e @openstack/etc/germ.yml
        ;;
    "openstack_monitor")
        cd $MODULE/../germ && ansible-playbook openstack/setup-prometheus.yml -e @openstack/etc/germ.yml
        ;;
    *)
        exit 1
        ;;
esac

