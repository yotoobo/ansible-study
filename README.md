# ansible-study

### 准备工具

- [vagrant](https://www.vagrantup.com/)
- [virtualbox](https://www.virtualbox.org/)
- [git](https://git-scm.com/downloads)
- [Zeal离线文档](https://zealdocs.org/)
- [vagrantbox 下载](http://www.vagrantbox.es/)

>NOTE: 本实例中使用vagrantbox为CentOS 6.5 x86_64。

---

### 如何使用

>NOTE: 本学习环境使用ansible-2.2.1，使用yum安装

1. 克隆本项目

`git clone https://github.com/yotoobo/ansible-study.git`

2. 启动虚拟机环境并登录master虚机

`cd ansible-study && vagrant up && vagrant ssh master`

3. 进入ansible-study，先来个ping

`$ ansible test -m ping`

4. 在本机部署个web环境(nginx + php)

`$ ansible-playbook site.yml -s`

---

### inventory
资产文件，是记录主机信息的配置文件。要操作的主机信息都保存在它那，有主机名、IP地址、用户名、密码、密钥等等。同时还可以自定义变量，格式为key=value, 多个变量由空格分开。

1. 和inventory有关的全局配置 ansible.cfg：

```

# 定义资产文件地址，可以是文件，也可以是目录
inventory = ./hosts/
```

2. 在本项目中，资产文件是hosts/test:

```
# 定义一个主机，设置ssh用户为root，ssh密码为123456
192.168.99.67 ansible_user=root ansible_ssh_pass=123456

# 定义一个test组，包含一个localhost主机
[test]
localhost

# 定义一个test-node组，包含了10.0.10.3和10.0.10.4两个主机
[test-node]
10.0.10.3
10.0.10.4

# 定义等价于test-node的组，不过主机使用了简写，当有大量主机很方便
[test2-node]
10.0.10.[3:4]

# 定义test-all组，使用关键字children说明它含有两个组成员
[test-all:children]
test
test-node

# 定义组test-all的变量，适用于其下的所有主机，比如10.0.10.3
[test-all:vars]
ansible_ssh_pass=vagrant

```

>NOTE: 如果组和主机设置了同样的变量，则主机后设置的变量优先于组变量

3. 使用ping模块测试test资产文件

    1. 对10.0.10.3进行ping：`$ ansible 10.0.10.3 -m ping`
    2. 对组test-all进行ping：`$ ansible test-all -m ping` 
    3. 对所有主机进行ping：`$ ansible all -m ping` 

---

### group_vars
这个目录下配置的都是主机组的变量，每一个**文件名**必须是已存在的组名。本项目中，group_vars目录下有两个文件：all文件中定义的变量适用于所有主机，是全局范围的变量，而test文件中定义的则只适用于test主机组。

以key: value 的形式定义变量：

```
KEY1: VALUE1
KEY2: VALUE2
```

---

### Todo

- [x] 2017-04-23: 新增部署 kubernetes cluster
- [x] 2017-04-17: 完成部署 redis
- [x] 2017-04-14: 完成部署 mysql
