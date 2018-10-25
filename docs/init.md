# 初始化云平台

## 工具容器
dire/ansible-tools

## 流程

### 脚本
```bash
tools/init.sh
```

### 流程

- 生成密码

- 生成private key

## 流程

```bash
ansible-playbook  -i inventory/inventory.cfg -e @../etc/kolla/globals.yml -e @../etc/kolla/passwords.yml /home/kolla/dire/steam/ansible/sit.yml  --limit control-2
```
