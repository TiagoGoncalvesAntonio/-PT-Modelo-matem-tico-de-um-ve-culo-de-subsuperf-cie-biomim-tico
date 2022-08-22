%=================Vizualização dos Resultados - Dive Ascend================
clc
clear

%=============Mergulho e Emersao Helicoidal==========
%Amplitude 20º
%Frequencia 1Hz

load('TOBIAS - HELICAL DIVE ASCEND MERGE - Lastro =0 - AOA_BB=5 - AOA_EB=5 - F=100 - Amp=20 - TDA=30');
X_5_5_30=X;
load('TOBIAS - HELICAL DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-5 - AOA_EB=-5 - F=100 - Amp=20 - TDA=-45');
X_n5_n5_n45=X;
load('TOBIAS - HELICAL DIVE ASCEND MERGE - Lastro =0 - AOA_BB=10 - AOA_EB=10 - F=100 - Amp=20 - TDA=-45');
X_10_10_n45=X;
load('TOBIAS - HELICAL DIVE ASCEND MERGE - Lastro =0 - AOA_BB=-10 - AOA_EB=-10 - F=100 - Amp=20 - TDA=30');
X_n10_n10_30=X;




%%
%Movimento no plano 3d 
figure
%set(gcf,'position',[400,200,500,400])
set(gcf,'PaperUnits','centimeters');
% 
set(gcf,'PaperSize',[13 10])
% % set(gcf,'PaperType','a4');
set(gcf,'PaperPosition',[0 0 12 9]);

plot3(X_5_5_30(length(X_prep):length(X_5_5_30),7),X_5_5_30(length(X_prep):length(X_5_5_30),8),X_5_5_30(length(X_prep):length(X_5_5_30),9),'LineWidth',1);
hold on
plot3(X_n5_n5_n45(length(X_prep):length(X_5_5_30),7),X_n5_n5_n45(length(X_prep):length(X_5_5_30),8),X_n5_n5_n45(length(X_prep):length(X_5_5_30),9),'LineWidth',1);
hold on
plot3(X_10_10_n45(length(X_prep):length(X_5_5_30),7),X_10_10_n45(length(X_prep):length(X_5_5_30),8),X_10_10_n45(length(X_prep):length(X_5_5_30),9),'LineWidth',1);
hold on
plot3(X_n10_n10_30(:,7),X_n10_n10_30(:,8),X_n10_n10_30(:,9),'LineWidth',1);
hold on
plot3(X(length(X_prep),7),X(length(X_prep),8),X(length(X_prep),9),'black*','LineWidth',1)
hold on
plot3(X_prep(:,7),X_prep(:,8),X_prep(:,9),'LineWidth',1,'Color',[0 0 0]);
daspect([2 2 3])

rotate3d on;
grid on
box on;
axis auto xy;
view(115,15)
set(gca, 'XDir','reverse')
set(gca, 'ZDir','reverse')

xlabel('$x(\mathrm{m})$','Interpreter','latex','FontName','times')
ylabel('$y(\mathrm{m})$','Interpreter','latex','FontName','times')
zlabel('$z(\mathrm{m})$','Interpreter','latex','FontName','times')

set(gca,'TickLabelInterpreter','latex')
legend({'$\alpha _{BB}=+5^\circ \quad \alpha _{EB}=+5^\circ \quad \theta_{ADC}=+30^\circ$',...
        '$\alpha _{BB}=-5^\circ \quad \alpha _{EB}=-5^\circ \quad \theta_{ADC}=-45^\circ$',...
        '$\alpha _{BB}=+10^\circ \quad \alpha _{EB}=+10^\circ \quad \theta_{ADC}=-45^\circ$',...
        '$\alpha _{BB}=-10^\circ \quad \alpha _{EB}=-10^\circ \quad \theta_{ADC}=+30^\circ$'
        },...
        'location','northeastoutside','Interpreter','latex','FontName','times')

warning('off','MATLAB:print:ContentTypeImageSuggested')

exportgraphics(gcf,'comparacao_helical_dive_ascend_ne.eps','BackgroundColor','none','ContentType','vector')
%print('-depsc','-tiff','-r300', '-painters','myVectorFile2.eps')

%print('comparacao_helical_dive_ascend','-depsc','-r1000');

%%

%Plot comparação das velocidades lineares

u_5_5_30_avg=mean(X_5_5_30(length(X_prep):length(X_5_5_30),1));
u_n5_n5_n45_avg=mean(X_n5_n5_n45(length(X_prep):length(X_n5_n5_n45),1));
u_10_10_n45_avg=mean(X_10_10_n45(length(X_prep):length(X_10_10_n45),1));
u_n10_n10_30_avg=mean(X_n10_n10_30(length(X_prep):length(X_n10_n10_30),1));

v_5_5_30_avg=mean(X_5_5_30(length(X_prep):length(X_5_5_30),2));
v_n5_n5_n45_avg=mean(X_n5_n5_n45(length(X_prep):length(X_n5_n5_n45),2));
v_10_10_n45_avg=mean(X_10_10_n45(length(X_prep):length(X_10_10_n45),2));
v_n10_n10_30_avg=mean(X_n10_n10_30(length(X_prep):length(X_n10_n10_30),2));

w_5_5_30_avg=mean(X_5_5_30(length(X_prep):length(X_5_5_30),3));
w_n5_n5_n45_avg=mean(X_n5_n5_n45(length(X_prep):length(X_n5_n5_n45),3));
w_10_10_n45_avg=mean(X_10_10_n45(length(X_prep):length(X_10_10_n45),3));
w_n10_n10_30_avg=mean(X_n10_n10_30(length(X_prep):length(X_n10_n10_30),3));

u_avg=[u_5_5_30_avg;u_n5_n5_n45_avg;u_10_10_n45_avg;u_n10_n10_30_avg];
v_avg=[v_5_5_30_avg;v_n5_n5_n45_avg;v_10_10_n45_avg;v_n10_n10_30_avg];
w_avg=[w_5_5_30_avg;w_n5_n5_n45_avg;w_10_10_n45_avg;w_n10_n10_30_avg];

val_x=[1;2;3;4];

figure('Renderer','painters');
set(gcf,'position',[400,200,1000,500])

subplot(1,3,1)
scatter(val_x,u_avg,100,'filled','r')

grid on
xticks([1 2 3 4])
xticklabels({'$\alpha_{BB}=\alpha_{EB}=5^\circ \: \theta_{ADC}=+30^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-5^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=10^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-10^\circ \: \theta_{ADC}=+30^\circ$'})
set(gca,'TickLabelInterpreter','latex')
set(gca,'XTickLabel',get(gca,'XTickLabel'),'fontsize',12)
xtickangle(45)
xlim([0 5])
ylim([0 0.6])
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')

subplot(1,3,2)
scatter(val_x,v_avg,100,'filled','g')

grid on
xticks([1 2 3 4])
xticklabels({'-3\pi','-2\pi','-\pi','0'})
xticklabels({'$\alpha_{BB}=\alpha_{EB}=5^\circ \: \theta_{ADC}=+30^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-5^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=10^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-10^\circ \: \theta_{ADC}=+30^\circ$'})
set(gca,'TickLabelInterpreter','latex')
set(gca,'XTickLabel',get(gca,'XTickLabel'),'fontsize',12)
xtickangle(45)
xlim([0 5])
ylim([-0.2 0.2])
ylabel('$v(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')

subplot(1,3,3)
scatter(val_x,w_avg,100,'filled','b')

grid on
xticks([1 2 3 4])
xticklabels({'-3\pi','-2\pi','-\pi','0'})
xticklabels({'$\alpha_{BB}=\alpha_{EB}=5^\circ \: \theta_{ADC}=+30^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-5^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=10^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-10^\circ \: \theta_{ADC}=+30^\circ$'})
set(gca,'TickLabelInterpreter','latex')
set(gca,'XTickLabel',get(gca,'XTickLabel'),'fontsize',12)
xtickangle(45)
xlim([0 5])
ylim([-0.3 0.3])
%set(gca, 'YTick', -0.3:0.05:0.3);
ylabel('$w(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times')

print('comparacao_helical_dive_ascend_u_v_w','-depsc');

%%

%Plot comparação 5 6 11

q_5_5_30_avg=mean(X_5_5_30(length(X_prep):length(X_5_5_30),5));
q_n5_n5_n45_avg=mean(X_n5_n5_n45(length(X_prep):length(X_n5_n5_n45),5));
q_10_10_n45_avg=mean(X_10_10_n45(length(X_prep):length(X_10_10_n45),5));
q_n10_n10_30_avg=mean(X_n10_n10_30(length(X_prep):length(X_n10_n10_30),5));

r_5_5_30_avg=mean(X_5_5_30(length(X_prep):length(X_5_5_30),6));
r_n5_n5_n45_avg=mean(X_n5_n5_n45(length(X_prep):length(X_n5_n5_n45),6));
r_10_10_n45_avg=mean(X_10_10_n45(length(X_prep):length(X_10_10_n45),6));
r_n10_n10_30_avg=mean(X_n10_n10_30(length(X_prep):length(X_n10_n10_30),6));

theta_5_5_30_avg=mean(X_5_5_30(length(X_prep):length(X_5_5_30),11));
theta_n5_n5_n45_avg=mean(X_n5_n5_n45(length(X_prep):length(X_n5_n5_n45),11));
theta_10_10_n45_avg=mean(X_10_10_n45(length(X_prep):length(X_10_10_n45),11));
theta_n10_n10_30_avg=mean(X_n10_n10_30(length(X_prep):length(X_n10_n10_30),11));

q_avg=[q_5_5_30_avg;q_n5_n5_n45_avg;q_10_10_n45_avg;q_n10_n10_30_avg];
r_avg=[r_5_5_30_avg;r_n5_n5_n45_avg;r_10_10_n45_avg;r_n10_n10_30_avg];
theta_avg=[theta_5_5_30_avg;theta_n5_n5_n45_avg;theta_10_10_n45_avg;theta_n10_n10_30_avg];

val_x=[1;2;3;4];

figure('Renderer','painters');
set(gcf,'position',[400,200,1000,500])

% subplot(1,3,1)
% scatter(val_x,rad2deg(q_avg),100,'filled','c')
% 
% grid on
% xticks([1 2 3 4])
% xticklabels({'$\alpha_{BB}=\alpha_{EB}=5^\circ \: \theta_{ADC}=+30^\circ$',...
%             '$\alpha_{BB}=\alpha_{EB}=-5^\circ \: \theta_{ADC}=-45^\circ$',...
%             '$\alpha_{BB}=\alpha_{EB}=10^\circ \: \theta_{ADC}=-45^\circ$',...
%             '$\alpha_{BB}=\alpha_{EB}=-10^\circ \: \theta_{ADC}=+30^\circ$'})
% set(gca,'TickLabelInterpreter','latex')
% set(gca,'XTickLabel',get(gca,'XTickLabel'),'fontsize',12)
% xtickangle(45)
% xlim([0 5])
% %ylim([0 0.6])
% ylabel('$q(\^circ/s)$','Interpreter','latex','FontSize',14,'FontName','times')

subplot(1,2,1)
scatter(val_x,rad2deg(r_avg),100,'filled','c')

grid on
xticks([1 2 3 4])
xticklabels({'-3\pi','-2\pi','-\pi','0'})
xticklabels({'$\alpha_{BB}=\alpha_{EB}=5^\circ \: \theta_{ADC}=+30^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-5^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=10^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-10^\circ \: \theta_{ADC}=+30^\circ$'})
set(gca,'TickLabelInterpreter','latex')
set(gca,'XTickLabel',get(gca,'XTickLabel'),'fontsize',12)
xtickangle(45)
xlim([0 5])
ylim([-30 20])
ylabel('$r(^\circ/ \mathrm{s})$','Interpreter','latex','FontSize',14,'FontName','times')

subplot(1,2,2)
scatter(val_x,rad2deg(theta_avg),100,'filled','MarkerFaceColor',[1 0.6 0],'MarkerEdgeColor',[1 0.6 0])

grid on
xticks([1 2 3 4])
xticklabels({'-3\pi','-2\pi','-\pi','0'})
xticklabels({'$\alpha_{BB}=\alpha_{EB}=5^\circ \: \theta_{ADC}=+30^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-5^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=10^\circ \: \theta_{ADC}=-45^\circ$',...
            '$\alpha_{BB}=\alpha_{EB}=-10^\circ \: \theta_{ADC}=+30^\circ$'})
set(gca,'TickLabelInterpreter','latex')
set(gca,'XTickLabel',get(gca,'XTickLabel'),'fontsize',12)
xtickangle(45)
xlim([0 5])
ylim([-10 10])
%set(gca, 'YTick', -0.3:0.05:0.3);
ylabel('$\theta(^\circ)$','Interpreter','latex','FontSize',14,'FontName','times')

print('comparacao_helical_dive_ascend_r_theta','-depsc');
