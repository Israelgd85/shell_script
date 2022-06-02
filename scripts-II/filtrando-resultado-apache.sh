#!/bin/bash
cd apache-log/

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"


#Valida se o formata do IP digitado pelo usuário esta corrento
if [[ $1 =~ $regex ]]
then
	cat apache.log | grep $1
	
	#Verifica se o ip informado existe no arquivo
	if [ $? -ne 0 ]
	then
		echo "O endereço IP procurado não esta presente no arquivo"
	fi

else
	echo "Formato não é valido"
fi


