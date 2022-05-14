#!/bin/bash
#此脚本适用于centos7.x版本使用！
#原配置文件备份
mk_name="/etc/yum.backups"
if [ -d $mk_name ];then
    echo "备份错误：/etc/yum.backups目录已存在!"
    echo "可忽略此提示继续使用！"
else
    echo "为避免造成意外情况,需备份原文件"
    mkdir /etc/yum.backups && mv /etc/yum.repos.d/* /etc/yum.backups/
    echo -e "\033[33m 备份成功!原yum数据在/etc/yum.backups目录内 \033[0m" 
fi
#主菜单
echo -e "\033[37m ————————————————————— \033[0m" 
echo -e "\033[32m centos7更换yum源集合 \033[0m"
echo -e "\033[37m 1.阿里云-(alyun) \033[0m"
echo -e "\033[37m 2.腾讯云-(tencent) \033[0m" 
echo -e "\033[37m 3.网易云-(163) \033[0m" 
echo -e "\033[37m 4.华为云-(HUAWEI) \033[0m" 
echo -e "\033[37m 5.中国科技大学-(ustc) \033[0m"
echo -e "\033[37m 6.清华大学-(tuna)\033[0m" 
echo -e "\033[37m 7.浙江大学-(ZJU) \033[0m" 
echo -e "\033[37m 8.南京大学-(NJU) \033[0m"
echo -e "\033[36m 9.恢复默认配置(restore) \033[0m"
echo -e "\033[37m ————————————————————— \033[0m" 
#定义一个判断系统版本的变量
issus=`cat /etc/redhat-release |sed -r 's/.* ([0-9]+)\..*/\1/'`
if [ $issus -eq 7 ];then
    echo "系统版本:`cat /etc/redhat-release` " 
    read -p "请输入您选择的对应数字编号:" number
else
    echo -e "\033[31m 你的操作系统不是centos 或不是centos7.x版本\033[0m"
    echo -e "\033[31m 因此，此脚本无法使用！\033[0m"
    fi 
if [ $number -eq 1 ];then
        curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
        yum clean all
        yum makecache
elif [ $number -eq 2 ];then
        curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos7_base.repo
        yum clean all
        yum makecache
elif [ $number -eq 3 ];then
        curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
        yum clean all
        yum makecache
elif [ $number -eq 4 ];then
        curl -o /etc/yum.repos.d/CentOS-Base.repo https://repo.huaweicloud.com/repository/conf/CentOS-7-reg.repo       
        yum clean all
        yum makecache
elif [ $number -eq 5 ];then
        curl -o /etc/yum.repos.d/CentOS-Base.repo https://disk.gsbok.cn/Shell/yum/ustc/CentOS-Base.repo
        yum clean all
        yum makecache
elif [ $number -eq 6 ];then
        curl -o /etc/yum.repos.d/CentOS-Base.repo https://disk.gsbok.cn/Shell/yum/tuna/CentOS-Base.repo
        yum clean all
        yum makecache
elif [ $number -eq 7 ];then
        curl -o /etc/yum.repos.d/CentOS-Base.repo https://disk.gsbok.cn/Shell/yum/zju/CentOS-Base.repo
        yum clean all
        yum makecache
elif [ $number -eq 8 ];then
        curl -o nju-yum.tar.gz  https://disk.gsbok.cn/Shell/yum/nju/nju-yum.tar.gz && tar -zxf nju-yum.tar.gz >/dev/null 2>&1 && mv -f ./nju/* /etc/yum.repos.d/ && rm -rf nju nju-yum.tar.gz
        yum clean all
        yum makecache
#恢复数据后会删除原备份文件，目的方便下一次执行此脚本
elif [ $number -eq 9 ];then
        mv -f /etc/yum.backups/* /etc/yum.repos.d/ && rm -rf /etc/yum.backups
        if [ $? -ne 0 ];then
                echo "恢复失败!"
            fi
else
echo -e "\033[31m 请输入正确的数字编号! \033[0m"
fi
