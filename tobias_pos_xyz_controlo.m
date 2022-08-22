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
%figure('Renderer','painters');
figure
set(gcf,'position',[400,0,1000,1000])

subplot(5,1,[1 2])
plot3(X(:,7),X(:,8),X(:,9),'LineWidth',2);
hold on;
plot3(X(1,7),X(1,8),X(1,9),'*g','LineWidth',2);
hold on;
plot3(X(end,7),X(end,8),X(end,9),'*r','LineWidth',2);
% hold on
% plot3(trajetoria(:,1),trajetoria(:,2),trajetoria(:,3),'LineWidth',2,'Color','r','LineStyle','--')
hold on
scatter3(trajetoria(:,1),trajetoria(:,2),trajetoria(:,3),150,'y','filled','Marker','p','MarkerEdgeColor','black','LineWidth',1);
hold on
for n = 1:numel(trajetoria(:,1))
    text(trajetoria(n,1)-2,trajetoria(n,2)+1,trajetoria(n,3)+2,num2str(n))
    hold on
end

legend({'Trajetória','Posição Inicial','Posição Final','Pontos da Trajétoria'},'Location','best','Interpreter','latex','FontName','times','FontSize',10);
title('Trajectória Tridimensional do Veículo','Interpreter','latex','FontName','times','FontWeight','normal');
box on;
xlabel('$x(\mathrm{m})$','Interpreter','latex','FontName','times','FontWeight','normal','FontSize',10)
ylabel('$y(\mathrm{m})$','Interpreter','latex','FontName','times','FontWeight','normal','FontSize',10)
zlabel('$z(\mathrm{m})$','Interpreter','latex','FontName','times','FontWeight','normal','FontSize',10)
grid on
set(gca,'TickLabelInterpreter','latex')
set(gca, 'ZDir','reverse');
set(gca, 'YDir','reverse');
view(-8,40)
ylim([-20 20])
zlim([-20 20])

subplot(5,1,3)
plot(T,rad2deg(X(:,12)),'LineWidth',1);
hold on;
plot(T,rad2deg(save_TDA),'LineWidth',1,'Color','red');
legend({'Resposta do TOBIAS','\theta_{ADC}'},'Location','best','FontName','times','FontSize',10);
box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',10,'FontName','times','FontWeight','normal')
ylabel({'Controlador de Guinada','$\psi (^\circ)$'},'Interpreter','latex','FontName','times','FontWeight','normal','FontSize',10)
grid on
set(gca,'TickLabelInterpreter','latex')

subplot(5,1,4)
plot(T,rad2deg(X(:,11)),'LineWidth',1);
hold on;
plot(T,save_alpha,'LineWidth',1,'Color','red');
legend({'Resposta do TOBIAS','\alpha'},'Location','best','FontName','times','FontSize',10);
box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',10,'FontName','times','FontWeight','normal')
ylabel({'Controlador de Cabeceio','$\theta (^\circ)$'},'Interpreter','latex','FontName','times','FontWeight','normal','FontSize',10)
grid on
set(gca,'TickLabelInterpreter','latex')

subplot(5,1,5)
plot(T,X(:,1),'LineWidth',1);
hold on;
plot(T,save_freq,'LineWidth',1,'Color','red');
legend({'u (m/s)','Frequência (Hz)'},'Location','best','FontName','times','FontSize',10);
box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',10,'FontName','times','FontWeight','normal')
ylabel({'Controlador de Velocidade','$u (m/s) \quad f (Hz) $'},'Interpreter','latex','FontName','times','FontWeight','normal','FontSize',10)
grid on
set(gca,'TickLabelInterpreter','latex')

% file_name=['Controlo_de_xyz_sem_velocidade'];
% print(file_name,'-depsc');

%exportgraphics(gcf,'Controlo_de_xyz_sem_velocidade.eps','BackgroundColor','none','ContentType','vector')
exportgraphics(gcf,'Controlo_de_xyz_com_velocidade.eps','BackgroundColor','none','ContentType','vector')


%%
figure
set(gcf,'position',[400,200,1000,400])

load('TOBIAS - CONTROLADOR 3D - ANGULO ENTRE VETORES - TEST - Kp_guinada =80 - Kd_guinada =0 - Kp_profundidade =30 - Kd_profundidade =800 - Kp_velocidade =0 - Kd_velocidade =0 - x_ref =70 - y_ref =0 - z_ref =0')
plot3(X(:,7),X(:,8),X(:,9),'LineWidth',2);
hold on;
load('TOBIAS - CONTROLADOR 3D - ANGULO ENTRE VETORES - TEST - Kp_guinada =80 - Kd_guinada =0 - Kp_profundidade =30 - Kd_profundidade =800 - Kp_velocidade =10 - Kd_velocidade =0 - x_ref =70 - y_ref =0 - z_ref =0')
plot3(X(:,7),X(:,8),X(:,9),'LineWidth',2);
hold on;
plot3(X(1,7),X(1,8),X(1,9),'*g','LineWidth',2);
hold on;
plot3(X(end,7),X(end,8),X(end,9),'*r','LineWidth',2);
% hold on
% plot3(trajetoria(:,1),trajetoria(:,2),trajetoria(:,3),'LineWidth',2,'Color','r','LineStyle','--')
hold on
scatter3(trajetoria(:,1),trajetoria(:,2),trajetoria(:,3),150,'y','filled','Marker','p','MarkerEdgeColor','black','LineWidth',1);
hold on
for n = 1:numel(trajetoria(:,1))
    text(trajetoria(n,1)-2,trajetoria(n,2)+1,trajetoria(n,3)+2,num2str(n))
    hold on
end

legend({'Trajetória Sem Controlo de Velocidade','Trajetória Com Controlo de Velocidade','Posição Inicial','Posição Final','Pontos da Trajétoria'},'Location','best','Interpreter','latex','FontName','times','FontSize',10);
title('Trajectória Tridimensional do Veículo','Interpreter','latex','FontName','times','FontWeight','normal');
box on;
xlabel('$x(\mathrm{m})$','Interpreter','latex','FontName','times','FontWeight','normal','FontSize',10)
ylabel('$y(\mathrm{m})$','Interpreter','latex','FontName','times','FontWeight','normal','FontSize',10)
zlabel('$z(\mathrm{m})$','Interpreter','latex','FontName','times','FontWeight','normal','FontSize',10)
grid on
set(gca,'TickLabelInterpreter','latex')
set(gca, 'ZDir','reverse');
set(gca, 'YDir','reverse');
view(-10,50)
ylim([-20 20])
zlim([-20 20])
exportgraphics(gcf,'Controlo_de_xyz_comparacao.eps','BackgroundColor','none','ContentType','vector')