# mysql_backup_script
数据库备份脚本

建议使用Linux的crontab定时进行备份，全量备份可以每3天做一次，增量备份每天都做，然后把文件打包压缩甚至可以加密scp到其他硬盘比较大的服务器上，这个面试MySQL 基本都会问到的
