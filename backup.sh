#### GRANT SELECT, RELOAD, PROCESS, LOCK TABLES, EXECUTE, REPLICATION CLIENT, EVENT ON *.* TO 'backup'@'localhost'


#!/bin/sh
config_file="/etc/my.cnf"
backup_user="root"
backup_pass=""
mysql_port="3306"
mysql_host="localhost"
backup_data_dir="/data/backup"
date_dir=`date +%Y%m%d`
date_time=`date +%Y%m%d_%H%M%S`
des3_password="Cn0REThswFD6zQwytaIhUf3w4vHNYsxvnPCoFNpZMHl6WYhPk2"

####################################################
#全量备份函数
####################################################
function Xtr_full_backup ()
{
    if [ ! -d "${backup_data_dir}" ]
        then
            mkdir -p "${backup_data_dir}"
    fi

    innobackupex --defaults-file=${config_file} \
        --user=${backup_user} --password=${backup_pass} \
        --port=${mysql_port} --host=${mysql_host} \
        --no-lock --no-timestamp \
        --stream=tar "${backup_data_dir}/${date_dir}" | gzip - | openssl des3 -salt -k "${des3_password}" > "${backup_data_dir}/${date_dir}_backup.tar.gz.des3"
    rm -rf ${backup_data_dir}/${date_dir}
}

####################################################
#主体备份函数
####################################################
function Main ()
{
         Xtr_full_backup
	 exit 0
}

####################################################
#开始备份
####################################################
Main

