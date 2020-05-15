#!/bin/bash
#获取当前时间
date_now=$(date "+%Y%m%d-%H%M%S")
backUpFolder=/data/backup
username="root"
password="YourPassword"


db_list="schema1 schema2  schema3"
#定义备份文件名
for db_name in $db_list
do
fileName="${db_name}_${date_now}.sql"
#定义备份文件目录
backUpFileName="${backUpFolder}/${fileName}"
echo "starting backup mysql ${db_name} at ${date_now}."
/usr/bin/mysqldump -u${username} -p${password}  --lock-tables=false --single-transaction=true --databases ${db_name} > ${backUpFileName}
#进入到备份文件目录
cd ${backUpFolder}
#压缩备份文件
tar zcvf ${fileName}.tar.gz ${fileName}
done
echo "finish backup mysql database ${db_name} at ${date_end}."