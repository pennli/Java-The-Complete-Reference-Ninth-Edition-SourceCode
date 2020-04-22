#! /bin/bash
# 遍历目录及其子目录中的所有文件
# sh listdirf.sh DIR_NAME
function read_dir(){
for file in `ls $1` #注意此处这是两个反引号，表示运行系统命令
do
 if [ -d $1"/"$file ] #注意此处之间一定要加上空格，否则会报错
 then
 read_dir $1"/"$file
 else
 echo $1"/"$file #在此处处理文件即可
 echo "$file" | awk -F. '{print $1".sh"}'
 mv $1"/"$file $1"/"$(echo "$file" | awk -F. '{print $1".sh"}')
 fi
done
}
#读取第一个参数
read_dir $1
