#!/bin/bash
cd /LABS/shell_script/scripts-II/apache-log

if [ -z $1  ]
then
	read -p "Você esqueceu de colocar o parâmentro (GET,POST,PUT,DELETE): " requisicao
	letra_maiuscula=$(echo $requisicao | awk '{ print toupper($1)}')
else
	letra_maiuscula=$(echo $requisicao | awk '{print toupper($1)}')
fi

case $letra_maiuscula in
	GET)
	cat apache.log | grep GET
	;;

	POST)
	cat apache.log | grep POST
	;;

	PUT)
	cat apache.log | grep PUT
	;;

	DELETE)
	cat apache.log | grep DELETE
	;;
	
	*)
	echo "O paramêtro passado não é valido"
	;;
esac

