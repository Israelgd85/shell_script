#!/bin/bash


#Verifica se existe o dir log, caso não ele é criado
if [ ! -d log ]
then
	mkdir log
fi

# Lista os 10 processos por pid e tamanho de memória 
processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for pid in $processos
do
	nome_processo=$(ps -p $pid -o comm=)
	echo -n $(date +%F,%T,) >> $nome_processo.log

	# informa o uso de mem do processo em KB
	tamanho_processo=$(ps -p $pid -o size | grep [0-9])
	
	#Converte tamanho_processo de KB para BM
	echo "$(bc <<< "scale=2;$tamanho_processo/1024) MB" >> log/$nome_processo.lo
done

