%=======================Vizualização dos Resultados========================
clc
clear

%=========================Importação Dos Dados=============================
[file_name,path] = uigetfile({'*.mat'}, 'Select mat file'); 

if isequal(file_name,0)
   disp('Seleção inválida ou cancelada');
else
    load(file_name);
end

%==========================Gráfico Percurso X(m)===========================
figure;
subplot(3,4,1)
plot(T,X(:,7),'LineWidth',1);
xlabel('t(s)');
ylabel('x(m)');
title('Deslocamento do veículo em X');
grid;
box on;
%==========================Gráfico Percurso Y(m)===========================
subplot(3,4,2)
plot(T,X(:,8),'LineWidth',1);
xlabel('t(s)');
ylabel('y(m)');
title('Deslocamento do veículo em Y');
grid;
box on;
%==========================Gráfico Percurso Z(m)===========================
subplot(3,4,3)
plot(T,X(:,9),'LineWidth',1);
xlabel('t(s)');
ylabel('z(m)');
title('Deslocamento do veículo em Z');
grid;
box on;
%========================Gráfico Velocidade X(m/s)=========================
subplot(3,4,5)
plot(T,X(:,1),'LineWidth',1);
xlabel('t(s)');
ylabel('u(m/s)');
title('Velocidade do veículo em X - u');
grid;
box on;
%========================Gráfico Velocidade Y(m/s)=========================
subplot(3,4,6)
plot(T,X(:,2),'LineWidth',1);
xlabel('t(s)');
ylabel('v(m/s)');
title('Velocidade do veículo em Y - v');
grid;
box on;
%========================Gráfico Velocidade Z(m/s)=========================
subplot(3,4,7)
plot(T,X(:,3),'LineWidth',1);
xlabel('t(s)');
ylabel('w(m/s)');
title('Velocidade do veículo em Z - w');
grid;
box on;
%==========================Gráfico Ângulo de Roll===========================
subplot(3,4,9)
plot(T,rad2deg(X(:,10)),'LineWidth',1);
xlabel('t(s)');
ylabel('\phi(\circ)');
title('Ângulo de roll - \phi');
grid;
box on;
%==========================Gráfico Ângulo de Pitch===========================
subplot(3,4,10)
plot(T,rad2deg(X(:,11)),'LineWidth',1);
xlabel('t(s)');
ylabel('\theta(\circ)');
title('Ângulo de pitch - \theta');
grid;
box on;
%==========================Gráfico Ângulo de Yaw===========================
subplot(3,4,11)
plot(T,rad2deg(X(:,12)),'LineWidth',1);
xlabel('t(s)');
ylabel('\psi(\circ)');
title('Ângulo de yaw - \psi');
grid;
box on;
%========================Gráfico Tridimensional============================
subplot(3,4,[4 8])
plot3(X(:,7),X(:,8),X(:,9),'LineWidth',2);
hold on
plot3(X(1,7),X(1,8),X(1,9),'*g','LineWidth',2);
hold on
plot3(X(end,7),X(end,8),X(end,9),'*r','LineWidth',2);
legend({'Trajetória','Posição Inicial','Posição Final'},'Location','best');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
title('Trajectória do Veículo - Gráfico Tridimensional');
rotate3d on;
box on;
axis auto xy;
zlim_min=min(X(:,9))-5;
zlim_max=max(X(:,9))+5;
zlim([zlim_min zlim_max]);
grid;
set(gca, 'XDir','reverse')
set(gca, 'ZDir','reverse')
%========================Gráfico Plano XY============================
subplot(3,4,12)
plot(X(:,7),X(:,8),'LineWidth',2);
hold on;
plot(X(1,7),X(1,8),'*g','LineWidth',2);
hold on;
plot(X(end,7),X(end,8),'*r','LineWidth',2);
legend({'Trajetória','Posição Inicial','Posição Final'},'Location','best');
xlabel('x(m)');
ylabel('y(m)');
title('Trajectória do Veículo - Plano XY');
grid;
box on;
set(gca, 'XDir','reverse')
set(gca, 'ZDir','reverse')
%axis equal;
%============================Título========================================
title_subplots=['Lastro =',num2str(m_lastro),'kg AOA BB=',num2str(aoa_BB),...
    'º AOA EB=',num2str(aoa_EB),'º Frequência =',num2str(freq_fin),'Hz  Amplitude='...
    ,num2str(rad2deg(theta_fin_amp)),'º  Ângulo de Desfasamento da Cauda=',...
    num2str(rad2deg(tail_deflection_angle)),'º'];

sgtitle(title_subplots);

% %%
% figure
% 
% O= [0 0];
% axis ([-0.02 0.180 -0.180 0.180]);
% grid on;
% 
% b_fin=0.160;
% %Loop for animation
% 
% for i=1:2858
%     %Posição oscilatoria da cauda
%     position=b_fin*[cos(theta_fin(i)) sin(theta_fin(i))];
%     %Origem da articulação
%     O_circ=viscircles([0 0],0.001);
%     %Cauda através de uma linha
%     cauda=line([O(1) position(1)],[O(2) position(2)]);
%     %Tempo de refrescamento do plot
%     pause(0.00001);
%     %Apagar o frame imediatamente anterior
%     if i<length(theta_fin)
%         delete(O_circ)
%         delete(cauda);
%     end
%     title('Variação da posição da extremidade da cauda');
%     xlabel('x(m)');
%     ylabel('y(m)');
% end








