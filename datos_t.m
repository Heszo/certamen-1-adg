function [tiempo,datos]= datos_t(A)
year = A(:,1); %creamos el vector años
contador = 0; %se crea un contador para utilizarlo luego en el ciclo for para reordenar la matriz
for i = 1:length(year)
 for j = 1:length(A(1,2:end)) %aqui A(fila1,columa2:end), end=hasta la ultima columna
 contador = contador+1;
 l = (j-1)/length(A(1,2:end))+(1/12)./2; %vector que va creando una división para cada uno de los meses
 tiempo(contador) = year(i)+l; %toma el año correspondiente y le suma el vector decimal anterior
 datos(contador) = A(i,j+1); %toma valores mensuales y los reordena en una sola fila
 end
end
tiempo=tiempo'; %se ocupa ()' para invertir la matriz, ahora es una columna
datos=datos'; % se ocupa ()' para invertir datos, ahora es una columna
return
end
