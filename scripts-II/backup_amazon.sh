#!/bin/bash

CAMINHO_BACKUP=/LABS/shell_script/scripts-II/backup_multilidae_amazon
cd $CAMINHO_BACKUP

data=$(date +%F)

if [ ! -d $data ]
then
	mkdir $data
fi

tabelas=$( sudo mysql -u root multilidae -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
	sudo mysqldump -u root multilidae $tabela > $CAMINHO_BACKUP/$data/$tabela.sql
done

#envias os arquivos para o bucket da Amazon
echo "aws s3 sync $CAMINHO_BACKUP s3://[nome do seu backet ]"


