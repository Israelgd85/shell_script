#!/bin/bash

converte_imagem(){
	local caminho_imagem=$1
	local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1}')
	convert $imgagem_sem_extensao.jpg $imgagem_sem_extensao.png
}


varrer_diretorio(){
	cd $1 
	for arquivo in *
	do
		local caminho_arquivo=$(find /LABS/shell_script/scripts-I/imagens-novos-livros -name $arquivo)
		if [ if -d $arquivo ]
		then
			varrer_diretorio $caminho_arquivo
		else
			converte_imagem $caminho_arquivo
		fi
	done
}

varrer_diretorio /LABS/shell_script/scripts-I/imagens-novos-livros

if [ $? -eq 0]
then
	echo "Conversão realizada com sucesso"
else
	echo "Houve um problema na conversão"
