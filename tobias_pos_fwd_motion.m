%=================Vizualização dos Resultados - FWD Motion=================
clc
clear

%=============Gráfico Velocidade Avanço - Comparar velocidade max==========
load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=20 - Amp=27 - TDA=0');
X_20=X;
u_20=mean(X_20(:,1));
f_20=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=40 - Amp=27 - TDA=0');
X_40=X;
u_40=mean(X_40(:,1));
f_40=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=60 - Amp=27 - TDA=0');
X_60=X;
u_60=mean(X_60(:,1));
f_60=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=27 - TDA=0');
X_100=X;
u_100=mean(X_100(:,1));
f_100=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=150 - Amp=27 - TDA=0');
X_150=X;
u_150=mean(X_150(:,1));
f_150=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=200 - Amp=27 - TDA=0');
X_200=X;
u_200=mean(X_200(:,1));
f_200=freq_fin;

f_plots=[f_20;f_40;f_60;f_100];
%u_plots=[u_20;u_40;u_60;u_100;u_150;u_200];

F=0:0.1:1.2;
u_up=2*0.1*1.14*F/0.25;
u_low=2*0.1*1.14*F/0.35;

figure('Renderer','painters');
u_plots=[u_20;u_40;u_60;u_100];
scatter(f_plots,u_plots,'filled','LineWidth',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
%hold on
%scatter(f_plots,u_plots,'filled','LineWidth',3,'MarkerFaceColor','g','MarkerEdgeColor','g');

hold on
plot(F,u_low,'--','Color','b','LineWidth',2);
hold on
plot(F,u_up,'--','Color','b','LineWidth',2);

xlabel('$f(\mathrm{Hz})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')

grid on
set(gca,'TickLabelInterpreter','latex')
legend({'$\theta _{A}=27^\circ $'},'Interpreter','latex','FontSize',12,'FontName','times','Location','southeast');

set(gcf,'position',[400,200,500,400])
print('comparacao_vel_avanco_otima','-depsc');



f_plots=[f_20;f_40;f_60;f_100;f_150;f_200];
for i=1:1:length(f_plots)
    legendInfo{i}=[num2str(f_plots(i)) '$\mathrm{Hz}$'];
end

%Gráfico

figure('Renderer','painters')
plot(T,X_20(:,1),'LineWidth',2);
hold on
plot(T,X_40(:,1),'LineWidth',2);
hold on
plot(T,X_60(:,1),'LineWidth',2);
hold on
plot(T,X_100(:,1),'LineWidth',2);
hold on
plot(T,X_150(:,1),'LineWidth',2);
hold on
plot(T,X_200(:,1),'LineWidth',2);

xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')
ylim([0 2])
grid on
set(gca,'TickLabelInterpreter','latex')
legend(legendInfo,'location','eastoutside','Interpreter','latex','FontSize',12,'FontName','times')

set(gcf,'position',[400,200,1080,720])
%print('comparacao_vel_avanco','-depsc');


%%
%==========Gráfico Velocidade Avanço - Comparar diferentes amplitudes======

%Amplitude 20º
load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=20 - Amp=20 - TDA=0');
X_20=X;
%u_20=mean(X_20(length(X_20)/2:length(X_20),1));
u_20=mean(X_20(:,1));
f_20=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=40 - Amp=20 - TDA=0');
X_40=X;
%u_40=mean(X_40(length(X_40)/2:length(X_40),1));
u_40=mean(X_40(:,1));
f_40=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=60 - Amp=20 - TDA=0');
X_60=X;
%u_60=mean(X_60(length(X_60)/2:length(X_60),1));
u_60=mean(X_60(:,1));
f_60=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=0');
X_100=X;
%u_100=mean(X_100(length(X_100)/2:length(X_100),1));
u_100=mean(X_100(:,1));
f_100=freq_fin;

figure('Renderer','painters');
subplot(3,1,3);
plot(T,X_20(:,1),'LineWidth',2);
hold on
plot(T,X_40(:,1),'LineWidth',2);
hold on
plot(T,X_60(:,1),'LineWidth',2);
hold on
plot(T,X_100(:,1),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')
ylim([0 0.8])
grid on
set(gca,'TickLabelInterpreter','latex')
title(['Amplitude = ', num2str(rad2deg(theta_fin_amp)), '$^\circ$'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');

%Amplitude 15º
load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=20 - Amp=15 - TDA=0');
X_20=X;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=40 - Amp=15 - TDA=0');
X_40=X;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=60 - Amp=15 - TDA=0');
X_60=X;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=15 - TDA=0');
X_100=X;

subplot(3,1,2);
plot(T,X_20(:,1),'LineWidth',2);
hold on
plot(T,X_40(:,1),'LineWidth',2);
hold on
plot(T,X_60(:,1),'LineWidth',2);
hold on
plot(T,X_100(:,1),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')
ylim([0 0.8])
grid on
set(gca,'TickLabelInterpreter','latex')
title(['Amplitude = ', num2str(rad2deg(theta_fin_amp)), '$^\circ$'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');

f_plots=[f_20;f_40;f_60;f_100];
for i=1:1:length(f_plots)
    legendInfo{i}=[num2str(f_plots(i)) '$\mathrm{Hz}$'];
end
lg=legend(legendInfo,'Interpreter','latex','FontSize',12,'FontName','times');
lg.Position(1:2)=[0.87 .42];


%Amplitude 10º
load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=20 - Amp=10 - TDA=0');
X_20=X;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=40 - Amp=10 - TDA=0');
X_40=X;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=60 - Amp=10 - TDA=0');
X_60=X;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=10 - TDA=0');
X_100=X;

subplot(3,1,1);
plot(T,X_20(:,1),'LineWidth',2);
hold on
plot(T,X_40(:,1),'LineWidth',2);
hold on
plot(T,X_60(:,1),'LineWidth',2);
hold on
plot(T,X_100(:,1),'LineWidth',2);
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')
ylim([0 0.8])
grid on
set(gca,'TickLabelInterpreter','latex')
title(['Amplitude = ', num2str(rad2deg(theta_fin_amp)), '$^\circ$'],'FontWeight','normal','Interpreter','latex','FontSize',12,'FontName','times');

set(gcf,'position',[400,200,1080,720])
print('comparacao_vel_avanco_amp_freq','-depsc');


%%
load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=10 - TDA=0');
X_100=X;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=60 - Amp=20 - TDA=0');
X_60=X;

figure('Renderer','painters');

plot(T,X_60(:,1),'LineWidth',2);
hold on
plot(T,X_100(:,1),'LineWidth',2);

xlabel('$t(s)$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$u(m/s)$','Interpreter','latex','FontSize',14,'FontName','times')
%ylim([0 0.8])
grid on
legend({'$\theta_{A}=10^\circ \quad f=1Hz$',...
        '$\theta_{A}=20^\circ \quad f=0.6Hz$'},...
        'location','southeast','Interpreter','latex','FontName','times')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'position',[400,200,1080,240])
%print('comparacao_oscilacao_vel_avanco','-depsc');

%%
%Outro

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=20 - Amp=20 - TDA=0');
X_20=X;
u_20=mean(X_20(:,1));
f_20=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=40 - Amp=20 - TDA=0');
X_40=X;
u_40=mean(X_40(:,1));
f_40=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=60 - Amp=20 - TDA=0');
X_60=X;
u_60=mean(X_60(:,1));
f_60=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=0');
X_100=X;
u_100=mean(X_100(:,1));
f_100=freq_fin;

f_plots=[f_20;f_40;f_60;f_100];
%u_plots=[u_20;u_40;u_60;u_100;u_150;u_200];

F=0:0.1:1.2;
u_up=2*0.08*1.14*F/0.25;
u_low=2*0.08*1.14*F/0.35;


u_plots=[u_20;u_40;u_60;u_100];
scatter(f_plots,u_plots,'filled','LineWidth',3,'MarkerFaceColor','g','MarkerEdgeColor','g');
%hold on
%scatter(f_plots,u_plots,'filled','LineWidth',3,'MarkerFaceColor','g','MarkerEdgeColor','g');

hold on
plot(F,u_low,'--','Color','b','LineWidth',2);
hold on
plot(F,u_up,'--','Color','b','LineWidth',2);

xlabel('$f(\mathrm{Hz})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'$\theta _{A}=20^\circ $'},'Interpreter','latex','FontSize',12,'FontName','times','Location','southeast');
set(gca,'YLim',[0 1])
set(gca,'YTick',(0:0.2:1))
set(gcf,'position',[400,200,500,400])
print('comparacao_vel_avanco_otima_2','-depsc');

%%
%Plot Paper
clc
clear

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=20 - Amp=27 - TDA=0');
X_20=X;
u_20=mean(X_20(:,1));
f_20=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=40 - Amp=27 - TDA=0');
X_40=X;
u_40=mean(X_40(:,1));
f_40=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=60 - Amp=27 - TDA=0');
X_60=X;
u_60=mean(X_60(:,1));
f_60=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=27 - TDA=0');
X_100=X;
u_100=mean(X_100(:,1));
f_100=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=150 - Amp=27 - TDA=0');
X_150=X;
u_150=mean(X_150(:,1));
f_150=freq_fin;

load('TOBIAS - FWD MOTION - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=200 - Amp=27 - TDA=0');
X_200=X;
u_200=mean(X_200(:,1));
f_200=freq_fin;

f_plots=[f_20;f_40;f_60;f_100];
for i=1:1:length(f_plots)
    legendInfo{i}=[num2str(f_plots(i)) '$\mathrm{Hz}$'];
end


figure('Renderer','painters')
plot(T,X_20(:,1),'LineWidth',1);
hold on
plot(T,X_40(:,1),'LineWidth',1);
hold on
plot(T,X_60(:,1),'LineWidth',1);
hold on
plot(T,X_100(:,1),'LineWidth',1);

xlabel('$t\mathrm{(s)}$','Interpreter','latex','FontSize',10,'FontName','times')
ylabel('$u\mathrm{(m/s)}$','Interpreter','latex','FontSize',10,'FontName','times')

grid on
set(gca,'TickLabelInterpreter','latex')
legend(legendInfo,'location','eastoutside','Interpreter','latex','FontSize',10,'FontName','times')

set(gcf,'units','centimeters','position',[10,10,15,10])
print('comparacao_vel_avanco_paper','-depsc');
