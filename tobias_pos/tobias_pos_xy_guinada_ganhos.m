%=======================Vizualização dos Resultados========================
clc
clear

%=========================Importação Dos Dados=============================

figure('Renderer','painters');
set(gcf,'position',[400,100,1200,400])

load('TOBIAS - CONTROLADOR GUINADA - ANGULO ENTRE VETORES - Kp =80 - Kd =0 - x_ref =40 - y_ref =10.mat')
subplot(1,3,2)
plot(T,save_psi_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,12)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\psi(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\psi_{ref}','\psi'},'Location','southeast','FontName','times');
title({'K_{p\psi}= 0.8'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR GUINADA - ANGULO ENTRE VETORES - Kp =100 - Kd =0 - x_ref =40 - y_ref =10.mat')
subplot(1,3,3)
plot(T,save_psi_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,12)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\psi(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\psi_{ref}','\psi'},'Location','southeast','FontName','times');
title({'K_{p\psi}= 1'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR GUINADA - ANGULO ENTRE VETORES - Kp =60 - Kd =0 - x_ref =40 - y_ref =10.mat')
subplot(1,3,1)
plot(T,save_psi_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,12)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\psi(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\psi_{ref}','\psi'},'Location','southeast','FontName','times');
title({'K_{p\psi}= 0.6'},'FontName','times','FontWeight','normal')

file_name=['Controlo_de_guinada_plano_xy_Kp=',num2str(Kp*100),'_ganhos'];
print(file_name,'-depsc');