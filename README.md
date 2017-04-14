# ansible-study

### 准备工具

- [vagrant](https://www.vagrantup.com/)
- [virtualbox](https://www.virtualbox.org/)
- [git](https://git-scm.com/downloads)
- [Zeal离线文档](https://zealdocs.org/)
- [vagrantbox 下载](http://www.vagrantbox.es/)

>NOTE: 本实例中使用vagrantbox为CentOS 6.5 x86_64, 适用于6.X

---

### 如何使用

1. 克隆本项目

`git clone https://github.com/yotoobo/ansible-study.git`

2. 启动虚拟机环境并登录master虚机

`cd ansible-study && vagrant up && vagrant ssh master`

3. 进入ansible-study，先来个ping

`$ ansible test -m ping`

4. 在本机部署个web环境(nginx + php)

`$ ansible-playbook site.yml -s`

---

### Todo list

- [x] 完成 mysql roles
- [ ] 完成 redis roles
- [ ] 完善 wiki
