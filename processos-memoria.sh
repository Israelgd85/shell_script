#!/bin/bash


#Verifica se existe o dir log, caso não ele é criado
if [ ! -d log ]
then
	mkdir log
fi

processos_memoria(){

# Lista os 10 processos por pid e tamanho de memória 
processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for pid in $processos
do
	#Informa o nome do processo e salva na variavel
	nome_processo=$(ps -p $pid -o comm=)
	echo -n $(date +%F,%T,) >> log/$nome_processo.log

	#Informa o uso de mem do processo em KB
	tamanho_processo=$(ps -p $pid -o size | grep [0-9])
	
	#Converte tamanho_processo de KB para BM
	echo "$(bc <<< "scale=2;$tamanho_processo/1024) MB" >> log/$nome_processo.lo
done
}

prcessos_memoria


#Testa a execução da função
if [ $? -eq 0 ]
then
	echo "Os arquivos foram salvos com sucesso"
else
	echo "Houve um problema na hora de salvar os arquivos"
fi

