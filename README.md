# ansible-study

### 准备工具

- vagrant
- virtualbox
- git

>NOTE: 本实例中使用vagrantbox为CentOS 6.5 x86_64.

### 如何使用

1. 克隆本项目

`git clone https://github.com/yotoobo/ansible-study.git`

2. 启动虚拟机环境并登录master虚机

`cd ansible-study && vagrant up && vagrant ssh master`

3. 进入ansible-study，先来个ping

`$ ansible test -m ping`

4. 在本机部署web环境(nginx + php)

`$ ansible-playbook site.yml -s`

^_^ 暂时先来这么多！