%=================Vizualização dos Resultados - Todas as Var X=================
clc
clear

%=========================Importação Dos Dados=============================
[file_name,path] = uigetfile({'*.mat'}, 'Select mat file'); 

if isequal(file_name,0)
   disp('Seleção inválida ou cancelada');
else
    load(file_name);
end

%load('TOBIAS - HELICAL DIVE ASCEND MERGE - Lastro =0 - AOA_BB=5 - AOA_EB=5 - F=100 - Amp=20 - TDA=30');
%load('TOBIAS - HELICAL DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-5 - AOA_EB=-5 - F=100 - Amp=20 - TDA=-45');
%load('TOBIAS - HELICAL DIVE ASCEND MERGE - Lastro =0 - AOA_BB=10 - AOA_EB=10 - F=100 - Amp=20 - TDA=-45');
%load('TOBIAS - HELICAL DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-10 - AOA_EB=-10 - F=100 - Amp=20 - TDA=30');


figure('Renderer','painters');

subplot(4,3,1)
plot(T,X(:,1),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14);
title(['Velocidade Linear de Avanço'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,2)
plot(T,X(:,2),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$v(\mathrm{m/s})$','Interpreter','latex','FontSize',14);
title(['Velocidade Linear de Deriva'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,3)
plot(T,X(:,3),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$w(\mathrm{m/s})$','Interpreter','latex','FontSize',14);
%CONTROLAR INSTO
ylim([min(X(:,3))-1 max(X(:,3))+1])
title(['Velocidade Linear de Arfagem'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,4)
plot(T,X(:,4),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$p(\mathrm{rad/s})$','Interpreter','latex','FontSize',14);
title(['Velocidade Angular de Balanço'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,5)
plot(T,X(:,5),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$q(\mathrm{rad/s})$','Interpreter','latex','FontSize',14);
%CONTROLAR INSTO
ylim([min(X(:,5))-1 max(X(:,5))+1])
title(['Velocidade Angular de Cabeceio'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,6)
plot(T,X(:,6),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$r(\mathrm{rad/s})$','Interpreter','latex','FontSize',14);
%CONTROLAR INSTO
%ylim([min(X(:,5))-1 max(X(:,5))+1])
title(['Velocidade Angular de Guinada'],'FontWeight','normal','Interpreter','latex','FontSize',12);
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,7)
plot(T,X(:,7),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$x(\mathrm{m})$','Interpreter','latex','FontSize',14);
%CONTROLAR INSTO
%ylim([min(X(:,5))-1 max(X(:,5))+1])
title(['Deslocamento em $x$'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,8)
plot(T,X(:,8),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$y(\mathrm{m})$','Interpreter','latex','FontSize',14);
%CONTROLAR INSTO
%ylim([min(X(:,5))-1 max(X(:,5))+1])
title(['Deslocamento em $y$'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,9)
plot(T,X(:,9),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$z(\mathrm{m})$','Interpreter','latex','FontSize',14);
%CONTROLAR INSTO
%ylim([min(X(:,5))-1 max(X(:,5))+1])
title(['Deslocamento em $z$'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,10)
plot(T,X(:,10),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$\phi (\mathrm{rad})$','Interpreter','latex','FontSize',14);
%CONTROLAR INSTO
%ylim([min(X(:,5))-1 max(X(:,5))+1])
title(['Ângulo de Balanço'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,11)
plot(T,X(:,11),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$\theta (\mathrm{rad})$','Interpreter','latex','FontSize',14);
%CONTROLAR INSTO
ylim([min(X(:,5))-1 max(X(:,5))+1])
title(['Ângulo de Cabeceio'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

subplot(4,3,12)
plot(T,X(:,12),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14);
ylabel('$\psi (\mathrm{rad})$','Interpreter','latex','FontSize',14);
%CONTROLAR INSTO
%ylim([min(X(:,5))-1 max(X(:,5))+1])
title(['Ângulo de Guinada'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');
grid on;
set(gca,'TickLabelInterpreter','latex');

titulo=['AOA BB= ',num2str(aoa_BB),...
    'º AOA EB= ',num2str(aoa_EB),'º Frequência= ',num2str(freq_fin),'Hz  Amplitude= '...
    ,num2str(rad2deg(theta_fin_amp)),'º  Ângulo de Desfasamento da Cauda= ',...
    num2str(rad2deg(tail_deflection_angle)),'º'];

sgtitle(titulo,'interpreter', 'latex','FontSize',20,'FontName','times');
set(gcf,'position',[0,0,1920,1080])

file_name=['AOA_BB=',num2str(aoa_BB),'_AOA_EB=',num2str(aoa_EB),...
    '_F=',num2str(freq_fin*100),'_Amp=',num2str(rad2deg(theta_fin_amp)),...
    '_TDA=',num2str(rad2deg(tail_deflection_angle))];

%print(file_name,'-depsc');