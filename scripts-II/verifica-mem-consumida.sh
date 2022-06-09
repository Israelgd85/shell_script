#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }' )
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
relacao_mem_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')

if [ $relacao_mem_atual_total -gt 10 ]
then
mail -s "consumo de memoria acima do limite" israelgd85@gmail.com<<del
O consumo de memoria esta acima do limite que foi especificado, atualmente o valor e de $(free -h | grep -i mem | awk '{print $3}') 
del
fi

