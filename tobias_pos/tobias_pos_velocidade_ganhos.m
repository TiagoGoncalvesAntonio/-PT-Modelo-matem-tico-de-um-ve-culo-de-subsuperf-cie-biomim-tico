%=======================Vizualização dos Resultados========================
clc
clear

%=========================Importação Dos Dados=============================

figure('Renderer','painters');
set(gcf,'position',[400,100,1200,800])

load('TOBIAS - CONTROLADOR 3D - ANGULO ENTRE VETORES - TEST - Kp_guinada =80 - Kd_guinada =0 - Kp_profundidade =30 - Kd_profundidade =800 - Kp_velocidade =5 - Kd_velocidade =0 - x_ref =30 - y_ref =10 - z_ref =5')
subplot(2,3,1)
plot(T,pos_ref(1)*ones(length(T),1),LineWidth=1)
hold on
plot(T,X(:,7),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$x(\mathrm{m})$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'x_{ref}','x_{b}'},'Location','southeast','FontName','times');
title({'K_{p dist}= 0.05'},'FontName','times','FontWeight','normal')
ylim([0 40])

subplot(2,3,4)
plot(T,X(:,1),LineWidth=1)
hold on
plot(T,save_freq,LineWidth=1)
box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel({'Velocidade de Avanço', 'Frequência de Oscilação'},'Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'u (m/s)','f (Hz)'},'Location','best','FontName','times');
ylim([0 1.2])

load('TOBIAS - CONTROLADOR 3D - ANGULO ENTRE VETORES - TEST - Kp_guinada =80 - Kd_guinada =0 - Kp_profundidade =30 - Kd_profundidade =800 - Kp_velocidade =10 - Kd_velocidade =0 - x_ref =30 - y_ref =10 - z_ref =5')
subplot(2,3,2)
plot(T,pos_ref(1)*ones(length(T),1),LineWidth=1)
hold on
plot(T,X(:,7),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$x(\mathrm{m})$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'x_{ref}','x_{b}'},'Location','southeast','FontName','times');
title({'K_{p dist}= 0.1'},'FontName','times','FontWeight','normal')
ylim([0 40])

subplot(2,3,5)
plot(T,X(:,1),LineWidth=1)
hold on
plot(T,save_freq,LineWidth=1)
box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel({'Velocidade de Avanço', 'Frequência de Oscilação'},'Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'u (m/s)','f (Hz)'},'Location','best','FontName','times');
ylim([0 1.2])

load('TOBIAS - CONTROLADOR 3D - ANGULO ENTRE VETORES - TEST - Kp_guinada =80 - Kd_guinada =0 - Kp_profundidade =30 - Kd_profundidade =800 - Kp_velocidade =20 - Kd_velocidade =0 - x_ref =30 - y_ref =10 - z_ref =5')
subplot(2,3,3)
plot(T,pos_ref(1)*ones(length(T),1),LineWidth=1)
hold on
plot(T,X(:,7),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$x(\mathrm{m})$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'x_{ref}','x_{b}'},'Location','southeast','FontName','times');
title({'K_{p dist}= 0.2'},'FontName','times','FontWeight','normal')
ylim([0 40])

subplot(2,3,6)
plot(T,X(:,1),LineWidth=1)
hold on
plot(T,save_freq,LineWidth=1)
box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel({'Velocidade de Avanço', 'Frequência de Oscilação'},'Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'u (m/s)','f (Hz)'},'Location','best','FontName','times');
ylim([0 1.2])

file_name=['Controlo_de_velocidade_ganhos'];
print(file_name,'-depsc');



