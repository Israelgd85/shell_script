#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
echo $resposta_http

if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor" israelgd85@gmail.com<<del
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteudo Web
del
		systemctl restart apache2
fi


