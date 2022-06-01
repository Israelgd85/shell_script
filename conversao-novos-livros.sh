#!/bin/bash

varrer_diretorio(){
	cd $1 
	for arquivo in *
	do
		local caminho_arquivo=$(find /LABS/shell_script/scripts-I/imagens-novos-livros -name $arquivo)
		if [ if -d $arquivo ]
		then
			varrer_diretorio $aquivo
		else
			#Conversao jpg para png
		fi
	done
}
