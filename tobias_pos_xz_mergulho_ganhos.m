%=======================Vizualização dos Resultados========================
clc
clear

%=========================Importação Dos Dados=============================

figure('Renderer','painters');
set(gcf,'position',[400,0,1200,1200])

load('TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =60 - Kd =0 - x_ref =60 - z_ref =5.mat')
subplot(3,3,2)
plot(T,save_theta_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,11)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\theta_{ref}','\theta'},'Location','best','FontName','times');
title({'K_{p\theta}= 0.6'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =80 - Kd =0 - x_ref =60 - z_ref =5.mat')
subplot(3,3,3)
plot(T,save_theta_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,11)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\theta_{ref}','\theta'},'Location','best','FontName','times');
title({'K_{p\theta}= 0.8'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =30 - Kd =0 - x_ref =60 - z_ref =5.mat')
subplot(3,3,1)
plot(T,save_theta_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,11)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\theta_{ref}','\theta'},'Location','best','FontName','times');
title({'K_{p\theta}= 0.3'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =60 - Kd =200 - x_ref =60 - z_ref =5')
subplot(3,3,7)
plot(T,save_theta_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,11)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\theta_{ref}','\theta'},'Location','best','FontName','times');
title({'K_{p\theta}= 0.6  K_{d\theta}= 0.2'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =60 - Kd =800 - x_ref =60 - z_ref =5')
subplot(3,3,8)
plot(T,save_theta_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,11)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\theta_{ref}','\theta'},'Location','best','FontName','times');
title({'K_{p\theta}= 0.6  K_{d\theta}= 0.8'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =60 - Kd =1400 - x_ref =60 - z_ref =5')
subplot(3,3,9)
plot(T,save_theta_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,11)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\theta_{ref}','\theta'},'Location','best','FontName','times');
title({'K_{p\theta}= 0.6  K_{d\theta}= 1.4'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =30 - Kd =200 - x_ref =60 - z_ref =5')
subplot(3,3,4)
plot(T,save_theta_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,11)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\theta_{ref}','\theta'},'Location','best','FontName','times');
title({'K_{p\theta}= 0.3  K_{d\theta}= 0.2'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =30 - Kd =800 - x_ref =60 - z_ref =5')
subplot(3,3,5)
plot(T,save_theta_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,11)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\theta_{ref}','\theta'},'Location','best','FontName','times');
title({'K_{p\theta}= 0.3  K_{d\theta}= 0.8'},'FontName','times','FontWeight','normal')

load('TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =30 - Kd =1400 - x_ref =60 - z_ref =5')
subplot(3,3,6)
plot(T,save_theta_ref,LineWidth=1)
hold on
plot(T,rad2deg(X(:,11)),LineWidth=1)

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontName','times','FontWeight','normal')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'\theta_{ref}','\theta'},'Location','best','FontName','times');
title({'K_{p\theta}= 0.3  K_{d\theta}= 1.4'},'FontName','times','FontWeight','normal')

file_name=['Controlo_de_profundidade_plano_xz_ganhos'];
print(file_name,'-depsc');