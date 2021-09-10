function [meanmovil,tiempomovil,stdmovil] = estadisticos_moviles(M,l) 
% d todos los datos a promediar, matriz
% l con cuantos datos se hace el promedio 
tiempo=M(:,1);
datos=M(:,2);
%
meanmovil = []; 
tiempomovil = [];
stdmovil = [];
c= 0; %contador 
for j= l:1:length(datos); 
    c= c+1;
    meanmovil(c) = nanmean(datos(j-l+1:j));
    tiempomovil(c) = nanmean(tiempo(j-l+1:j));
    stdmovil(c) = nanstd(datos(j-l+1:j));   
    tiempo1=tiempo(1:end-(l-1),1); %para partir en el primer dato (aqui se le da el orden al grafico de donde partir)
    tiempo2=tiempo(l:end,1) %final
end
%%%%%%%% graficos %%%%%
hold on
figure(1)
plot(tiempo,datos,'k','LineWidth',2)
plot(tiempo2,meanmovil,'r','LineWidth',2)
plot(tiempo2,meanmovil-stdmovil,'y','LineWidth',2)
plot(tiempo2,meanmovil-2.*stdmovil,'b--','LineWidth',2)
plot(tiempo2,meanmovil+stdmovil,'y','LineWidth',2)
plot(tiempo2,meanmovil+2.*stdmovil,'b--','LineWidth',2)
xlabel('Tiempo')             %nombre eje x
ylabel('Amplitud')   %nombre eje y
title('Extensión de hielo marino del polo norte') %nombre grafico
legend('datos','Media movil','std movil','2std movil','Location','best')
grid on
axis tight
saveas(figure(1),'imag.jpg') %guarda figura 
