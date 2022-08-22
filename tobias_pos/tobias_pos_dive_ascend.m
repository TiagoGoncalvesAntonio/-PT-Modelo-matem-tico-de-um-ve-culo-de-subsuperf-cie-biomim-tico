%=================Vizualização dos Resultados - Dive Ascend================
clc
clear

%=============Mergulho e Emersao==========
%Amplitude 20º
%Frequencia 1Hz

load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=1 - AOA_EB=1 - F=100 - Amp=20 - TDA=0');
X_1_1=X;
load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-1 - AOA_EB=-1 - F=100 - Amp=20 - TDA=0');
X_n1_n1=X;

load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=3 - AOA_EB=3 - F=100 - Amp=20 - TDA=0');
X_3_3=X;
load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-3 - AOA_EB=-3 - F=100 - Amp=20 - TDA=0');
X_n3_n3=X;

load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=5 - AOA_EB=5 - F=100 - Amp=20 - TDA=0');
X_5_5=X;
load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-5 - AOA_EB=-5 - F=100 - Amp=20 - TDA=0');
X_n5_n5=X;

load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=10 - AOA_EB=10 - F=100 - Amp=20 - TDA=0');
X_10_10=X;
load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-10 - AOA_EB=-10 - F=100 - Amp=20 - TDA=0');
X_n10_n10=X;

%%

%Plot compara as diferentes respostas no plano vertical XZ

figure('Renderer','painters');
set(gcf,'position',[400,200,1000,600])

plot(X_1_1(length(X_prep):length(X_1_1),7),X_1_1(length(X_prep):length(X_1_1),9),'LineWidth',2,'LineStyle','--','Color',[0 0.4470 0.7410]);
hold on
plot(X_n1_n1(length(X_prep):length(X_1_1),7),X_n1_n1(length(X_prep):length(X_1_1),9),'LineWidth',2,'Color',[0 0.4470 0.7410]);
hold on;

plot(X_3_3(length(X_prep):length(X_1_1),7),X_3_3(length(X_prep):length(X_1_1),9),'LineWidth',2,'LineStyle','--','Color',[0.8500 0.3250 0.0980]);
hold on
plot(X_n3_n3(length(X_prep):length(X_1_1),7),X_n3_n3(length(X_prep):length(X_1_1),9),'LineWidth',2,'Color',[0.8500 0.3250 0.0980]);
hold on;

plot(X_5_5(length(X_prep):length(X_1_1),7),X_5_5(length(X_prep):length(X_1_1),9),'LineWidth',2,'LineStyle','--','Color',[0.9290 0.6940 0.1250]);
hold on
plot(X_n5_n5(length(X_prep):length(X_1_1),7),X_n5_n5(length(X_prep):length(X_1_1),9),'LineWidth',2,'Color',[0.9290 0.6940 0.1250]);
hold on;

plot(X_10_10(length(X_prep):length(X_1_1),7),X_10_10(length(X_prep):length(X_1_1),9),'LineWidth',2,'LineStyle','--','Color',[0.4940 0.1840 0.5560]);
hold on
plot(X_n10_n10(:,7),X_n10_n10(:,9),'LineWidth',2,'Color',[0.4940 0.1840 0.5560]);
hold on;
scatter(X_n10_n10(length(X_prep),7),X_n10_n10(length(X_prep),9),65,'g','filled')

set(gca, 'YDir','reverse')
xlabel('$x(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$z(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'$\alpha _{BB}=+1^\circ \quad \alpha _{EB}=+1^\circ $',...
        '$\alpha _{BB}=-1^\circ \quad \alpha _{EB}=-1^\circ $',...
        '$\alpha _{BB}=+3^\circ \quad \alpha _{EB}=+3^\circ $',...
        '$\alpha _{BB}=-3^\circ \quad \alpha _{EB}=-3^\circ $',...
        '$\alpha _{BB}=+5^\circ \quad \alpha _{EB}=+5^\circ $',...
        '$\alpha _{BB}=-5^\circ \quad \alpha _{EB}=-5^\circ $',...
        '$\alpha _{BB}=+10^\circ \quad \alpha _{EB}=+10^\circ $',...
        '$\alpha _{BB}=-10^\circ \quad \alpha _{EB}=-10^\circ $',...
        'Atuação das Barbatanas Peitorais',...
         },...
        'location','southwest','Interpreter','latex','FontSize',11,'FontName','times')

print('comparacao_dive_ascend','-depsc');
%%
%Plot comparar velocidades de avanço e arfagem

u_1_1_avg=mean(X_1_1(length(X_prep):length(X_1_1),1));
u_n1_n1_avg=mean(X_n1_n1(length(X_prep):length(X_n1_n1),1));
u_3_3_avg=mean(X_3_3(length(X_prep):length(X_3_3),1));
u_n3_n3_avg=mean(X_n3_n3(length(X_prep):length(X_n3_n3),1));
u_5_5_avg=mean(X_5_5(length(X_prep):length(X_5_5),1));
u_n5_n5_avg=mean(X_n5_n5(length(X_prep):length(X_n5_n5),1));
u_10_10_avg=mean(X_10_10(length(X_prep):length(X_10_10),1));
u_n10_n10_avg=mean(X_n10_n10(length(X_prep):length(X_n10_n10),1));

u_avg=[u_n10_n10_avg;u_n5_n5_avg;u_n3_n3_avg;u_n1_n1_avg;u_1_1_avg;u_3_3_avg;u_5_5_avg;u_10_10_avg];

w_1_1_avg=mean(X_1_1(length(X_prep):length(X_1_1),3));
w_n1_n1_avg=mean(X_n1_n1(length(X_prep):length(X_n1_n1),3));
w_3_3_avg=mean(X_3_3(length(X_prep):length(X_3_3),3));
w_n3_n3_avg=mean(X_n3_n3(length(X_prep):length(X_n3_n3),3));
w_5_5_avg=mean(X_5_5(length(X_prep):length(X_5_5),3));
w_n5_n5_avg=mean(X_n5_n5(length(X_prep):length(X_n5_n5),3));
w_10_10_avg=mean(X_10_10(length(X_prep):length(X_10_10),3));
w_n10_n10_avg=mean(X_n10_n10(length(X_prep):length(X_n10_n10),3));

w_avg=[w_n10_n10_avg;w_n5_n5_avg;w_n3_n3_avg;w_n1_n1_avg;w_1_1_avg;w_3_3_avg;w_5_5_avg;w_10_10_avg];

aoa=[-10; -5; -3; -1; 1; 3; 5; 10];

p_u_pos = polyfit(aoa(5:8), u_avg(5:8), 1);
px_u_pos = [aoa(5,1) aoa(8,1)];
py_u_pos = polyval(p_u_pos, px_u_pos);

p_u_neg = polyfit(aoa(1:4), u_avg(1:4), 1);
px_u_neg = [aoa(1) aoa(4)];
py_u_neg = polyval(p_u_neg, px_u_neg);

p_w = polyfit(aoa, w_avg, 1);
px_w = [min(aoa) max(aoa)];
py_w = polyval(p_w, px_w);


figure('Renderer','painters');
set(gcf,'position',[400,200,1000,400])

subplot(1,2,1)
scatter(aoa,u_avg,75,'b','filled');
hold on
plot(px_u_pos, py_u_pos, 'LineWidth', 1,'LineStyle','--','Color','b');
hold on
plot(px_u_neg, py_u_neg, 'LineWidth', 1,'LineStyle','--','Color','b');

grid on
xticks([-10 -5 -3 -1 1 3 5 10])
xticklabels({'$\alpha_{BB}=-10^\circ \: \alpha_{EB}=-10^\circ$',...
            '$\alpha_{BB}=-5^\circ \: \alpha_{EB}=-5^\circ$',...
            '$\alpha_{BB}=-3^\circ \: \alpha_{EB}=-3^\circ$',...
            '$\alpha_{BB}=-1^\circ \: \alpha_{EB}=-1^\circ$',...
            '$\alpha_{BB}=1^\circ \: \alpha_{EB}=1^\circ$',...
            '$\alpha_{BB}=3^\circ \: \alpha_{EB}=3^\circ$',...
            '$\alpha_{BB}=5^\circ \: \alpha_{EB}=5^\circ$',...
            '$\alpha_{BB}=10^\circ \: \alpha_{EB}=10^\circ$',...
            })
set(gca,'TickLabelInterpreter','latex')
xtickangle(45)
xlim([-12 12])
%xlabel('$\alpha_{BB} \quad \alpha_{BB}$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')

subplot(1,2,2)
scatter(aoa,w_avg,75,'g','filled');
hold on
plot(px_w, py_w, 'LineWidth', 1,'LineStyle','--','Color','g ');

grid on
xticks([-10 -5 -3 -1 1 3 5 10])
xticklabels({'$\alpha_{BB}=-10^\circ \: \alpha_{EB}=-10^\circ$',...
            '$\alpha_{BB}=-5^\circ \: \alpha_{EB}=-5^\circ$',...
            '$\alpha_{BB}=-3^\circ \: \alpha_{EB}=-3^\circ$',...
            '$\alpha_{BB}=-1^\circ \: \alpha_{EB}=-1^\circ$',...
            '$\alpha_{BB}=1^\circ \: \alpha_{EB}=1^\circ$',...
            '$\alpha_{BB}=3^\circ \: \alpha_{EB}=3^\circ$',...
            '$\alpha_{BB}=5^\circ \: \alpha_{EB}=5^\circ$',...
            '$\alpha_{BB}=10^\circ \: \alpha_{EB}=10^\circ$',...
            })
set(gca,'TickLabelInterpreter','latex')
xtickangle(45)
xlim([-12 12])
%xlabel('$\alpha_{BB} \quad \alpha_{BB}$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$w(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')

print('comparacao_dive_ascend_u_w','-depsc');

%%
%Plot comparar angulo de pitch e velocidade de cabeceio

theta_1_1_avg=mean(X_1_1(length(X_prep):length(X_1_1),11));
theta_n1_n1_avg=mean(X_n1_n1(length(X_prep):length(X_n1_n1),11));
theta_3_3_avg=mean(X_3_3(length(X_prep):length(X_3_3),11));
theta_n3_n3_avg=mean(X_n3_n3(length(X_prep):length(X_n3_n3),11));
theta_5_5_avg=mean(X_5_5(length(X_prep):length(X_5_5),11));
theta_n5_n5_avg=mean(X_n5_n5(length(X_prep):length(X_n5_n5),11));
theta_10_10_avg=mean(X_10_10(length(X_prep):length(X_10_10),11));
theta_n10_n10_avg=mean(X_n10_n10(length(X_prep):length(X_n10_n10),11));

theta_avg=[theta_n10_n10_avg;theta_n5_n5_avg;theta_n3_n3_avg;theta_n1_n1_avg;theta_1_1_avg;theta_3_3_avg;theta_5_5_avg;theta_10_10_avg];
theta_avg=rad2deg(theta_avg);
aoa=[-10; -5; -3; -1; 1; 3; 5; 10];

p_theta = polyfit(aoa, theta_avg, 1);
px_theta = [min(aoa) max(aoa)];
py_theta = polyval(p_theta, px_theta);

figure('Renderer','painters');
set(gcf,'position',[400,200,1000,400])

scatter(aoa,theta_avg,75,'r','filled');
hold on
plot(px_theta, py_theta, 'LineWidth', 1,'LineStyle','--','Color','r');

grid on
xticks([-10 -5 -3 -1 1 3 5 10])
xticklabels({'$\alpha_{BB}=-10^\circ \: \alpha_{EB}=-10^\circ$',...
            '$\alpha_{BB}=-5^\circ \: \alpha_{EB}=-5^\circ$',...
            '$\alpha_{BB}=-3^\circ \: \alpha_{EB}=-3^\circ$',...
            '$\alpha_{BB}=-1^\circ \: \alpha_{EB}=-1^\circ$',...
            '$\alpha_{BB}=1^\circ \: \alpha_{EB}=1^\circ$',...
            '$\alpha_{BB}=3^\circ \: \alpha_{EB}=3^\circ$',...
            '$\alpha_{BB}=5^\circ \: \alpha_{EB}=5^\circ$',...
            '$\alpha_{BB}=10^\circ \: \alpha_{EB}=10^\circ$',...
            })
set(gca,'TickLabelInterpreter','latex')
xtickangle(45)
xlim([-12 12])
%ylim([-11 11])
%xlabel('$\alpha_{BB} \quad \alpha_{BB}$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$\theta(^\circ)$','Interpreter','latex','FontSize',14,'FontName','times')
print('comparacao_dive_ascend_theta','-depsc');

%%

%Plot paper

clc
clear

%Amplitude 20º
%Frequencia 1Hz

load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=1 - AOA_EB=1 - F=100 - Amp=20 - TDA=0');
X_1_1=X;
load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-1 - AOA_EB=-1 - F=100 - Amp=20 - TDA=0');
X_n1_n1=X;

load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=3 - AOA_EB=3 - F=100 - Amp=20 - TDA=0');
X_3_3=X;
load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-3 - AOA_EB=-3 - F=100 - Amp=20 - TDA=0');
X_n3_n3=X;

load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=5 - AOA_EB=5 - F=100 - Amp=20 - TDA=0');
X_5_5=X;
load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-5 - AOA_EB=-5 - F=100 - Amp=20 - TDA=0');
X_n5_n5=X;

load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=10 - AOA_EB=10 - F=100 - Amp=20 - TDA=0');
X_10_10=X;
load('TOBIAS - DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-10 - AOA_EB=-10 - F=100 - Amp=20 - TDA=0');
X_n10_n10=X;



figure('Renderer','painters');

plot(X_1_1(length(X_prep):length(X_1_1),7),X_1_1(length(X_prep):length(X_1_1),9),'LineWidth',1,'LineStyle','--','Color',[0 0.4470 0.7410]);
hold on
plot(X_n1_n1(length(X_prep):length(X_1_1),7),X_n1_n1(length(X_prep):length(X_1_1),9),'LineWidth',1,'Color',[0 0.4470 0.7410]);
hold on;

plot(X_3_3(length(X_prep):length(X_1_1),7),X_3_3(length(X_prep):length(X_1_1),9),'LineWidth',1,'LineStyle','--','Color',[0.8500 0.3250 0.0980]);
hold on
plot(X_n3_n3(length(X_prep):length(X_1_1),7),X_n3_n3(length(X_prep):length(X_1_1),9),'LineWidth',1,'Color',[0.8500 0.3250 0.0980]);
hold on;

plot(X_5_5(length(X_prep):length(X_1_1),7),X_5_5(length(X_prep):length(X_1_1),9),'LineWidth',1,'LineStyle','--','Color',[0.9290 0.6940 0.1250]);
hold on
plot(X_n5_n5(length(X_prep):length(X_1_1),7),X_n5_n5(length(X_prep):length(X_1_1),9),'LineWidth',1,'Color',[0.9290 0.6940 0.1250]);
hold on;

plot(X_10_10(length(X_prep):length(X_1_1),7),X_10_10(length(X_prep):length(X_1_1),9),'LineWidth',1,'LineStyle','--','Color',[0.4940 0.1840 0.5560]);
hold on
plot(X_n10_n10(length(X_prep):length(X_1_1),7),X_n10_n10(length(X_prep):length(X_1_1),9),'LineWidth',1,'Color',[0.4940 0.1840 0.5560]);
hold on
plot(X_n10_n10(length(X_prep),7),X_n10_n10(length(X_prep),9),'black*','LineWidth',1)
hold on;
plot(X_n10_n10(1:length(X_prep),7),X_n10_n10(1:length(X_prep),9),'LineWidth',1,'Color','black');

set(gca, 'YDir','reverse')
xlabel('$x\mathrm{(m)}$','Interpreter','latex','FontSize',10,'FontName','times')
ylabel('$z\mathrm{(m)}$','Interpreter','latex','FontSize',10,'FontName','times')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'$\alpha _{BB}=+1^\circ \quad \alpha _{EB}=+1^\circ $',...
        '$\alpha _{BB}=-1^\circ \quad \alpha _{EB}=-1^\circ $',...
        '$\alpha _{BB}=+3^\circ \quad \alpha _{EB}=+3^\circ $',...
        '$\alpha _{BB}=-3^\circ \quad \alpha _{EB}=-3^\circ $',...
        '$\alpha _{BB}=+5^\circ \quad \alpha _{EB}=+5^\circ $',...
        '$\alpha _{BB}=-5^\circ \quad \alpha _{EB}=-5^\circ $',...
        '$\alpha _{BB}=+10^\circ \quad \alpha _{EB}=+10^\circ $',...
        '$\alpha _{BB}=-10^\circ \quad \alpha _{EB}=-10^\circ $',...
         },...
        'NumColumns',2,...
        'location','northoutside',...
        'Interpreter','latex', ...
        'FontSize',10, ...
        'FontName','times')

set(gcf,'units','centimeters','position',[10,10,15,10])
print('comparacao_dive_ascend_paper_PT','-depsc');