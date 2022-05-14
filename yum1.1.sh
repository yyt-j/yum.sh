#!/bin/bash


#此脚本仅适用于centos(5,6,7,8)系列使用.
#centos8 有些是替换原yum配置文件内的链接实现更换源的
#因此如果使用者自己之前修改过yum源就会造成替换失败未知报错!
#数据无价望慎用！

#定义一个判断系统版本的变量
issus=`cat /etc/redhat-release |sed -r 's/.* ([0-9]+)\..*/\1/'`
if [ `echo $UID` -eq 0 ] && [ -f "/etc/redhat-release" ];then
        #原配置文件备份
        mk_name="/etc/yum.backups"
        if [ -d $mk_name ];then
                echo "备份错误：/etc/yum.backups目录已存在!"
                echo "可忽略此提示继续使用！"
        else
                echo "为避免造成意外情况,需备份原文件"
                mkdir /etc/yum.backups && cp /etc/yum.repos.d/* /etc/yum.backups/
                echo -e "\033[33m 备份成功!原yum数据在/etc/yum.backups目录内 \033[0m" 
        fi
#centos5更换yum源配置
        if [ $issus -eq 5 ];then
#菜单
                echo -e "\033[37m 1.腾讯云-(tencent) \033[0m" 
                echo -e "\033[37m 2.网易云-(163) \033[0m" 
                echo -e "\033[36m 3.恢复默认配置(restore) \033[0m"
                echo "系统版本:`cat /etc/redhat-release` " 
                read -p "请输入您选择的对应数字编号:" number
                        if [ $number -eq 1 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos5_base.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 2 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS5-Base-163.repo && yum clean all && yum makecache
                                fi
		#恢复已备份的源文件
                        if [ $number -eq 3 ];then
                                mv -f /etc/yum.backups/* /etc/yum.repos.d/ && rm -rf /etc/yum.backups && echo "恢复成功！" || echo "恢复失败"
                                fi
        #centos6更换yum源配置
        elif [ $issus -eq 6 ];then
                #菜单
                echo -e "\033[37m 1.阿里云-(alyun) \033[0m"
                echo -e "\033[37m 2.腾讯云-(tencent) \033[0m" 
                echo -e "\033[37m 3.网易云-(163) \033[0m" 
                echo -e "\033[36m 4.恢复默认配置(restore) \033[0m"
                echo "系统版本:`cat /etc/redhat-release` " 
                read -p "请输入您选择的对应数字编号:" number
                        if [ $number -eq 1 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-6.10.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 2 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos6_base.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 3 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS6-Base-163.repo && yum clean all && yum makecache
                                fi
		#恢复已备份的源文件
                        if [ $number -eq 4 ];then
                                mv -f /etc/yum.backups/* /etc/yum.repos.d/ && rm -rf /etc/yum.backups && echo "恢复成功！" || echo "恢复失败"
                                fi
#centos7更换yum源配置字段
        elif [ $issus -eq 7 ];then
#菜单
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
                echo "系统版本:`cat /etc/redhat-release` "
                read -p "请输入您选择的对应数字编号:" number    
                        if [ $number -eq 1 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 2 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos7_base.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 3 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 4 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo https://repo.huaweicloud.com/repository/conf/CentOS-7-reg.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 5 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo https://disk.gsbok.cn/Shell/yum/ustc/CentOS-Base.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 6 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo https://disk.gsbok.cn/Shell/yum/tuna/CentOS-Base.repo && yum clean all && yum makecache
                                fi
                         if [ $number -eq 7 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo https://disk.gsbok.cn/Shell/yum/zju/CentOS-Base.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 8 ];then
                                curl -o nju-yum.tar.gz  https://disk.gsbok.cn/Shell/yum/nju/nju-yum.tar.gz && tar -zxf nju-yum.tar.gz >/dev/null 2>&1 && mv -f ./nju/* /etc/yum.repos.d/ && rm -rf nju nju-yum.tar.gz && yum clean all && yum makecache
                                fi
		#恢复数据后会删除原备份文件，目的方便下一次执行此脚本
                        if [ $number -eq 9 ];then
                                mv -f /etc/yum.backups/* /etc/yum.repos.d/ && rm -rf /etc/yum.backups  && echo "恢复成功！" || echo "恢复失败"
                                fi
#centos8更换yum源配置字段
        elif [ $issus -eq 8 ];then
#菜单
                echo -e "\033[37m ————————————————————— \033[0m" 
                echo -e "\033[32m centos更换yum源集合 \033[0m"
                echo -e "\033[37m 1.阿里云-(alyun) \033[0m"
                echo -e "\033[37m 2.腾讯云-(tencent) \033[0m"  
                echo -e "\033[37m 3.华为云-(HUAWEI) \033[0m" 
                echo -e "\033[37m 4.中国科技大学-(ustc) \033[0m"
                echo -e "\033[37m 5.清华大学-(tuna)\033[0m" 
                echo -e "\033[37m 6.浙江大学-(ZJU) \033[0m" 
                echo -e "\033[37m 7.南京大学-(NJU) \033[0m"
                echo -e "\033[36m 8.恢复默认配置(restore) \033[0m"
                echo -e "\033[37m ————————————————————— \033[0m"  
                echo "系统版本:`cat /etc/redhat-release` " 
                read -p "请输入您选择的对应数字编号:" number    
                        if [ $number -eq 1 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 2 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos8_base.repo && yum clean all && yum makecache
		                fi
                        if [ $number -eq 3 ];then
                                curl -o /etc/yum.repos.d/CentOS-Base.repo https://repo.huaweicloud.com/repository/conf/CentOS-8-reg.repo && yum clean all && yum makecache
                                fi
                        if [ $number -eq 4 ];then
                                sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
                                -e 's|^#baseurl=http://mirror.centos.org/$contentdir|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
                                -i.bak \
                                /etc/yum.repos.d/CentOS-Stream-AppStream.repo \
                                /etc/yum.repos.d/CentOS-Stream-BaseOS.repo \
                                /etc/yum.repos.d/CentOS-Stream-Extras.repo \
                                /etc/yum.repos.d/CentOS-Stream-PowerTools.repo
                                        yum clean all
                                        yum makecache
                                fi
                        if [ $number -eq 5 ];then
                                sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
                                -e 's|^#baseurl=http://mirror.centos.org/$contentdir|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos|g' \
                                -i.bak \
                                /etc/yum.repos.d/CentOS-*.repo
                                        yum clean all
                                        yum makecache
                                 fi
                        if [ $number -eq 6 ];then
                                sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
                                -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.zju.edu.cn|g' \
                                -i.bak \
                                /etc/yum.repos.d/CentOS-*.repo
                                        yum clean all
                                        yum makecache
                                fi
                        if [ $number -eq 7 ];then
                                sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
                                -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirror.nju.edu.cn|g' \
                                -i.bak \
                                /etc/yum.repos.d/CentOS-*.repo
                                        yum clean all 
                                        yum makecache
                                fi
		#恢复数据后会删除原备份文件，目的方便下一次执行此脚本
                        if [ $number -eq 8 ];then
                                mv -f /etc/yum.backups/* /etc/yum.repos.d/ && rm -rf /etc/yum.backups  && echo "恢复成功！" || echo "恢复失败"
                                fi
        else 
                echo -e "\033[31m 你的操作系统不是centos(5,6,7,8).x版本\033[0m"
                echo -e "\033[31m 因此，此脚本无法在您的操作系统上运行！\033[0m"
        fi
else
	echo -e "\033[31m 执行错误！\033[0m"
	echo -e "\033[32m 可能是以下原因造成: \033[0m"
	echo -e "\033[31m 1.请检查当前是否是ROOT用户执行此脚本,如果不是请切换ROOT用户执行！\033[0m"
	echo -e "\033[31m 2.你的系统不是centos系统！\033[0m"
 fi
