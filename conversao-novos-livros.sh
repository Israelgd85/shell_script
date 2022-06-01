#!/bin/bash

varrer_diretorio(){
	cd $1 
	for arquivo in *
	do
		if [ if -d $arquivo ]
		then
			varrer_diretorio $aquivo
		else
			#Conversao jpg para png
		fi
	done
}
