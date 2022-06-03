#!/bin/bash
cd /LABS/shell_script/scripts-II/apache-log

case $1 in
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

