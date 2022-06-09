#! /bin/bash

#Função para convertar a imagem
converte_imagem(){

cd imagens-livros

# Verifica se o dir png existe
if [ ! -d png ]
then
    mkdir png
fi

#Filtra a imagem sem a extensão jpg e converte imagem em png

for imagem in *.jpg
do
    local imagem_sem_extensao=$(ls $imagem | awk -F. '{print $1}')
    convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png

done
}

converte_imagem 2> erros_conversao.txt

if [ $? -eq 0 ]
then   
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo"
fi

