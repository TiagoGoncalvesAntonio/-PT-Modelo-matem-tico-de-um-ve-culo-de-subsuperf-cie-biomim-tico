%=================Vizualização dos Resultados - Turning Circle=============
clc
clear

%============Comparar Diâmetro Tático=========
%Amplitude 20º
%Frequencia 1Hz
load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=5');
X_5=X;
size_prep=length(X_prep);

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=-5');
X_n5=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=15');
X_15=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=-15');
X_n15=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=30');
X_30=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=-30');
X_n30=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=45');
X_45=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=-45');
X_n45=X;

%=======================Grafico com os subplots dos diametros taticos a 1Hz
figure('Renderer','painters');
set(gcf,'position',[0,0,1000,800])

subplot(2,2,1)
plot(X_5(:,8),X_5(:,7),'LineWidth',2);
hold on
plot(X_n5(:,8),X_n5(:,7),'LineWidth',1.5);
hold on;
plot(X_5(size_prep,8),X_5(size_prep,7),'*g','LineWidth',2);
% hold on;
% plot(X_5(end,8),X_5(end,7),'*r','LineWidth',2);
% hold on;
% plot(X_n5(end,8),X_n5(end,7),'*r','LineWidth',2);

%Diametro tático

%Verificar qual o ponto onde a proa está a 180º
[val,idx]=min(abs(X_5(:,12)-deg2rad(180)));

d_5_1=X_5(idx,8)-X_5(size_prep,8);

ha = annotation('doublearrow','LineWidth',1,'LineStyle','--');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.X = [X_5(size_prep,8) X_5(idx,8)];
ha.Y = [X_5(size_prep,7)+d_5_1/2+3 X_5(size_prep,7)+d_5_1/2+3];
hold on
plot([X_5(idx,8) X_5(idx,8)],[X_5(idx,7) X_5(size_prep,7)+d_5_1/2+3],'LineStyle','--','Color',[0 0 0],'LineWidth',1);
hold on
plot([0 0],[X_5(idx,7) X_5(size_prep,7)+d_5_1/2+3],'LineStyle','--','Color',[0 0 0],'LineWidth',1);
hold on

ha = annotation('textbox','String',['Diâmetro tático = ', num2str(d_5_1,'%.1f'),'m'],'FontName','times','FontSize',11,'LineStyle','none','Interpreter','latex', 'FontWeight','normal');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.Position=[0 X_5(size_prep,7)+d_5_1/2+5 d_5_1 5];
ha.HorizontalAlignment=['center'];
ha.VerticalAlignment=['bottom'];

xlabel('$y(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$x(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'$\theta _{ADC}=+5^\circ$','$\theta_{ADC}=-5^\circ$','Momento de Guinada'},'location','northoutside','NumColumns',1,'Interpreter','latex','FontSize',11,'FontName','times')
ylim([-20 50])

subplot(2,2,2)
plot(X_15(:,8),X_15(:,7),'LineWidth',2);
hold on
plot(X_n15(:,8),X_n15(:,7),'LineWidth',1.5);
hold on;
plot(X_15(size_prep,8),X_15(size_prep,7),'*g','LineWidth',2);
% hold on;
% plot(X_15(end,8),X_15(end,7),'*r','LineWidth',2);
% hold on;
% plot(X_n15(end,8),X_n15(end,7),'*r','LineWidth',2);
% hold on

%Diametro tático

%Verificar qual o ponto onde a proa está a 180º
[val,idx]=min(abs(X_15(:,12)-deg2rad(180)));

d_15_1=X_15(idx,8)-X_15(size_prep,8);

ha = annotation('doublearrow','LineWidth',1,'LineStyle','--');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.X = [X_15(size_prep,8) X_15(idx,8)];
ha.Y = [X_15(size_prep,7)-d_15_1/2 X_15(size_prep,7)-d_15_1/2];
hold on
plot([X_15(idx,8) X_15(idx,8)],[X_15(size_prep,7)-d_15_1/2 X_15(idx,7)],'LineStyle','--','Color',[0 0 0],'LineWidth',1);
hold on

ha = annotation('textbox','String',['Diâmetro tático = ', num2str(d_15_1,'%.1f'),'m'],'FontName','times','FontSize',11,'LineStyle','none','Interpreter','latex', 'FontWeight','normal');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.Position=[0+1 X_15(size_prep,7)-d_15_1/2-2.25 d_15_1 5];
ha.HorizontalAlignment=['center'];
ha.VerticalAlignment=['bottom'];

xlabel('$y(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$x(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'$\theta _{ADC}=+15^\circ$','$\theta_{ADC}=-15^\circ$','Momento de Guinada'},'location','northoutside','NumColumns',1,'Interpreter','latex','FontSize',11,'FontName','times')
ylim([0 20])
xlim([-18 18])

subplot(2,2,3)
plot(X_30(:,8),X_30(:,7),'LineWidth',2);
hold on
plot(X_n30(:,8),X_n30(:,7),'LineWidth',1.5);
hold on;
plot(X_30(size_prep,8),X_30(size_prep,7),'*g','LineWidth',2);
% hold on;
% plot(X_30(end,8),X_30(end,7),'*r','LineWidth',2);
% hold on;
% plot(X_n30(end,8),X_n30(end,7),'*r','LineWidth',2);
%Diametro tático

%Verificar qual o ponto onde a proa está a 180º
[val,idx]=min(abs(X_30(:,12)-deg2rad(180)));

d_30_1=X_30(idx,8)-X_30(size_prep,8);

ha = annotation('doublearrow','LineWidth',1,'LineStyle','--');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.X = [X_30(size_prep,8) X_30(idx,8)];
ha.Y = [X_30(size_prep,7)-d_30_1/2 X_30(size_prep,7)-d_30_1/2];
hold on
plot([X_30(idx,8) X_30(idx,8)],[X_30(size_prep,7)-d_30_1/2 X_30(idx,7)],'LineStyle','--','Color',[0 0 0],'LineWidth',1);
hold on

ha = annotation('textbox','String',['Diâmetro tático = ', num2str(d_30_1,'%.1f'),'m'],'FontName','times','FontSize',11,'LineStyle','none','Interpreter','latex', 'FontWeight','normal');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.Position=[0+1.5 X_30(size_prep,7)-d_30_1/2-1.75 d_30_1 5];
ha.HorizontalAlignment=['center'];
ha.VerticalAlignment=['bottom'];

xlabel('$y(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$x(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'$\theta _{ADC}=+30^\circ$','$\theta_{ADC}=-30^\circ$','Momento de Guinada'},'location','northoutside','NumColumns',1,'Interpreter','latex','FontSize',11,'FontName','times')
xlim([-10 10])

subplot(2,2,4)
plot(X_45(:,8),X_45(:,7),'LineWidth',2);
hold on
plot(X_n45(:,8),X_n45(:,7),'LineWidth',1.5);
hold on;
plot(X_45(size_prep,8),X_45(size_prep,7),'*g','LineWidth',2);
% hold on;
% plot(X_45(end,8),X_45(end,7),'*r','LineWidth',2);
% hold on;
% plot(X_n45(end,8),X_n45(end,7),'*r','LineWidth',2);

%Diametro tático

%Verificar qual o ponto onde a proa está a 180º
[val,idx]=min(abs(X_45(:,12)-deg2rad(180)));

d_45_1=X_45(idx,8)-X_45(size_prep,8);

ha = annotation('doublearrow','LineWidth',1,'LineStyle','--');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.X = [X_45(size_prep,8) X_45(idx,8)];
ha.Y = [X_45(size_prep,7)-d_45_1/2+0.5 X_45(size_prep,7)-d_45_1/2+0.5];
hold on
plot([X_45(idx,8) X_45(idx,8)],[X_45(size_prep,7)-d_45_1/2+0.5 X_45(idx,7)],'LineStyle','--','Color',[0 0 0],'LineWidth',1);
hold on

ha = annotation('textbox','String',['Diâmetro tático = ', num2str(d_45_1,'%.1f'),'m'],'FontName','times','FontSize',11,'LineStyle','none','Interpreter','latex', 'FontWeight','normal');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.Position=[0+2 X_45(size_prep,7)-d_45_1/2-1.25 d_45_1 5];
ha.HorizontalAlignment=['center'];
ha.VerticalAlignment=['bottom'];

xlabel('$y(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$x(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'$\theta _{ADC}=+45^\circ$','$\theta_{ADC}=-45^\circ$','Momento de Guinada'},'location','northoutside','NumColumns',1,'Interpreter','latex','FontSize',11,'FontName','times')
xlim([-8 8])

%print('comparacao_diametro_tactico','-depsc');


%===================Todos no mesmo plot===================================
% figure('Renderer','painters');
% set(gcf,'position',[0,0,1920,1200])
% 
% plot(X_5(:,8),X_5(:,7),'LineWidth',2);
% hold on
% plot(X_n5(:,8),X_n5(:,7),'LineWidth',1.5);
% hold on;
% plot(X_5(size_prep,8),X_5(size_prep,7),'*g','LineWidth',2);
% hold on
% plot(X_15(:,8),X_15(:,7),'LineWidth',2);
% hold on
% plot(X_n15(:,8),X_n15(:,7),'LineWidth',1.5);
% hold on;
% plot(X_30(:,8),X_30(:,7),'LineWidth',2);
% hold on
% plot(X_n30(:,8),X_n30(:,7),'LineWidth',1.5);
% hold on;
% plot(X_45(:,8),X_45(:,7),'LineWidth',2);
% hold on
% plot(X_n45(:,8),X_n45(:,7),'LineWidth',1.5);
% xlabel('$y(m)$','Interpreter','latex','FontSize',14,'FontName','times')
% ylabel('$x(m)$','Interpreter','latex','FontSize',14,'FontName','times')
% grid on
% set(gca,'TickLabelInterpreter','latex')


%========================================Grafico comparação das velocidades 
u_5_avg=mean(X_5(size_prep:length(X_5),1));
v_5_avg=mean(X_5(size_prep:length(X_5),2));


u_15_avg=mean(X_15(size_prep:length(X_15),1));
v_15_avg=mean(X_15(size_prep:length(X_15),2));

u_30_avg=mean(X_30(size_prep:length(X_30),1));
v_30_avg=mean(X_30(size_prep:length(X_30),2));

u_45_avg=mean(X_45(size_prep:length(X_45),1));
v_45_avg=mean(X_45(size_prep:length(X_45),2));

u_avg=[u_5_avg;u_15_avg;u_30_avg;u_45_avg];
v_avg=[v_5_avg;v_15_avg;v_30_avg;v_45_avg];

amp=[5;15;30;45];

p_u = polyfit(amp, u_avg, 1);
px_u = [min(amp) max(amp)];
py_u = polyval(p_u, px_u);

p_v = polyfit(amp, v_avg, 1);
px_v = [min(amp) max(amp)];
py_v = polyval(p_v, px_v);

figure('Renderer','painters');
set(gcf,'position',[200,200,1000,400])

subplot(1,2,1)
scatter(amp,u_avg,100,'filled','MarkerEdgeColor','r','MarkerFaceColor','r');
hold on
plot(px_u, py_u, 'LineWidth', 1,'LineStyle','--','Color','r');

xlim([0 50])
ylim([0.5 0.66])
xlabel('$\theta_{ADC} (^\circ)$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$u(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')

subplot(1,2,2)
scatter(amp,v_avg,100,'filled','MarkerEdgeColor','g','MarkerFaceColor','g');
hold on
plot(px_v, py_v, 'LineWidth', 1,'LineStyle','--','Color','g');

xlim([0 50])
ylim([-0.13 0])
xlabel('$\theta_{ADC} (^\circ)$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$v(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')

%print('comparacao_diametro_tactico_velocidade_u_v','-depsc');

r_5_avg=mean(X_5(size_prep:length(X_5),6));

r_15_avg=mean(X_15(size_prep:length(X_15),6));

r_30_avg=mean(X_30(size_prep:length(X_30),6));

r_45_avg=mean(X_45(size_prep:length(X_45),6));

r_n5_avg=mean(X_n5(size_prep:length(X_n5),6));

r_n15_avg=mean(X_n15(size_prep:length(X_n15),6));

r_n30_avg=mean(X_n30(size_prep:length(X_n30),6));

r_n45_avg=mean(X_n45(size_prep:length(X_n45),6));


r_avg=[r_5_avg;r_15_avg;r_30_avg;r_45_avg; r_n5_avg;r_n15_avg;r_n30_avg;r_n45_avg];
r_avg=rad2deg(r_avg);

amp=[5;15;30;45;-5;-15;-30;-45];

p_r = polyfit(amp, r_avg, 1);
px_r = [min(amp) max(amp)];
py_r = polyval(p_r, px_r);

figure('Renderer','painters');
set(gcf,'position',[200,200,1000,400])

scatter(amp,r_avg,100,'filled','MarkerEdgeColor','b','MarkerFaceColor','b');
hold on
plot(px_r, py_r, 'LineWidth', 1,'LineStyle','--','Color','b');

xticks(-50:10:50)
% xlim([-50 50])
ylim([-30 30])
xlabel('$\theta_{ADC} (^\circ)$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$r(^\circ/ \mathrm{s})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')

%print('comparacao_diametro_tactico_velocidade_r','-depsc');

%===========================================================Recoil Motions

theta_5_avg=mean(X_5(size_prep:length(X_5),11));

theta_15_avg=mean(X_15(size_prep:length(X_15),11));

theta_30_avg=mean(X_30(size_prep:length(X_30),11));

theta_45_avg=mean(X_45(size_prep:length(X_45),11));

theta_avg=[theta_5_avg;theta_15_avg;theta_30_avg;theta_45_avg];
theta_avg=rad2deg(theta_avg);

q_5_avg=mean(X_5(size_prep:length(X_5),5));

q_15_avg=mean(X_15(size_prep:length(X_15),5));

q_30_avg=mean(X_30(size_prep:length(X_30),5));

q_45_avg=mean(X_45(size_prep:length(X_45),5));

q_avg=[q_5_avg;q_15_avg;q_30_avg;q_45_avg];
q_avg=rad2deg(q_avg);

w_5_avg=mean(X_5(size_prep:length(X_5),3));

w_15_avg=mean(X_15(size_prep:length(X_15),3));

w_30_avg=mean(X_30(size_prep:length(X_30),3));

w_45_avg=mean(X_45(size_prep:length(X_45),3));

w_avg=[w_5_avg;w_15_avg;w_30_avg;w_45_avg];

amp=[5;15;30;45];

p_theta = polyfit(amp, theta_avg, 1);
px_theta= [min(amp) max(amp)];
py_theta = polyval(p_theta, px_theta);

p_q = polyfit(amp, q_avg, 1);
px_q= [min(amp) max(amp)];
py_q = polyval(p_q, px_q);

p_w = polyfit(amp, w_avg, 1);
px_w= [min(amp) max(amp)];
py_w = polyval(p_w, px_w);

figure('Renderer','painters');
set(gcf,'position',[200,200,1000,400])

subplot(1,3,3)
scatter(amp,theta_avg,100,'filled','MarkerEdgeColor','m','MarkerFaceColor','m');
hold on
plot(px_theta, py_theta, 'LineWidth', 1,'LineStyle','--','Color','m');
xlim([0 50])
xlabel('$\theta_{ADC} (^\circ)$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$\theta (^\circ)$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')

subplot(1,3,2)
scatter(amp,q_avg,100,'filled','MarkerEdgeColor','g','MarkerFaceColor','g');
hold on
plot(px_q, py_q, 'LineWidth', 1,'LineStyle','--','Color','g');
xlim([0 50])
xlabel('$\theta_{ADC} (^\circ)$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$q (^\circ/ \mathrm{s})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')

subplot(1,3,1)
scatter(amp,w_avg,100,'filled','MarkerEdgeColor','c','MarkerFaceColor','c');
hold on
plot(px_w, py_w, 'LineWidth', 1,'LineStyle','--','Color','c');
xlim([0 50])
ylim([-0.1 0])
xlabel('$\theta_{ADC} (^\circ)$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$w(\mathrm{m/s})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')

print('comparacao_diametro_tactico_recoil','-depsc');


%%

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=30');
X_30=X;
size_prep=length(X_prep);
load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=10 - AOA_EB=-10 - F=100 - Amp=20 - TDA=30');
X_30_lemes=X;

%Verificar qual o ponto onde a proa está a 180º
[val,idx]=min(abs(X_30(:,12)-deg2rad(180)));

d_30_1=X_30(idx,8)-X_30(size_prep,8);

[val_2,idx_2]=min(abs(X_30_lemes(:,12)-deg2rad(180)));

d_30_lemes_1=X_30_lemes(idx_2,8)-X_30_lemes(size_prep,8);

figure('Renderer','painters')
set(gcf,'position',[200,200,1000,600])
plot(X_30(:,8),X_30(:,7),'LineWidth',2);
hold on
plot(X_30_lemes(:,8),X_30_lemes(:,7),'LineWidth',2);
hold on;
plot(X_30(size_prep,8),X_30(size_prep,7),'*g','LineWidth',2);

ha = annotation('doublearrow','LineWidth',1,'LineStyle','--');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.X = [X_30(size_prep,8) X_30(idx,8)];
ha.Y = [X_30(size_prep,7)-d_30_1/2-5 X_30(size_prep,7)-d_30_1/2-5];
hold on
plot([X_30(idx,8) X_30(idx,8)],[X_30(size_prep,7)-d_30_1/2-5 X_30(idx,7)],'LineStyle','--','Color',[0 0 0],'LineWidth',1);
hold on

ha = annotation('textbox','String',['Diâmetro tático = ', num2str(d_30_1,'%.1f'),'m'],'FontName','times','FontSize',14,'LineStyle','none','Interpreter','latex', 'FontWeight','normal');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.Position=[0 X_30(size_prep,7)-d_30_1/2-6 d_30_1 5];
ha.HorizontalAlignment=['center'];
ha.VerticalAlignment=['bottom'];

ha = annotation('doublearrow','LineWidth',1,'LineStyle','--');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.X = [X_30_lemes(size_prep,8) X_30_lemes(idx,8)];
ha.Y = [X_30_lemes(size_prep,7)-d_30_lemes_1/2-3 X_30_lemes(size_prep,7)-d_30_lemes_1/2-3];
hold on
plot([X_30_lemes(idx_2,8) X_30_lemes(idx_2,8)],[X_30_lemes(size_prep,7)-d_30_lemes_1/2-3 X_30_lemes(idx_2,7)],'LineStyle','--','Color',[0 0 0],'LineWidth',1);
hold on

ha = annotation('textbox','String',['Diâmetro tático = ', num2str(d_30_lemes_1,'%.1f'),'m'],'FontName','times','FontSize',14,'LineStyle','none','Interpreter','latex', 'FontWeight','normal');
ha.Parent = gca;  % associate annotation with current axes
% now you can use data units
ha.Position=[0 X_30_lemes(size_prep,7)-d_30_lemes_1/2-4 d_30_lemes_1 5];
ha.HorizontalAlignment=['center'];
ha.VerticalAlignment=['bottom'];


xlabel('$y(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
ylabel('$x(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times')
grid on
set(gca,'TickLabelInterpreter','latex')
xlim([-6 12])
ylim([0 16])
legend({'$\theta_{ADC}=+30 \quad \alpha _{BB}=0^{\circ} \quad \alpha _{EB}=0^{\circ}$',...
        '$\theta_{ADC}=+30 \quad \alpha _{BB}=10^{\circ} \quad \alpha _{EB}=-10^{\circ}$',...
        'Momento de Guinada'},'location','northoutside','Interpreter','latex','FontSize',11,'FontName','times')

print('comparacao_diametro_tactico_bp','-depsc');


u_avg=mean(X_30(size_prep:length(X_30),1));
v_avg=mean(X_30(size_prep:length(X_30),2));
r_avg=mean(X_30(size_prep:length(X_30),6));

%Recoil
w_avg=mean(X_30(size_prep:length(X_30),3));
q_avg=mean(X_30(size_prep:length(X_30),5));
theta_avg=mean(X_30(size_prep:length(X_30),11));



u_lemes_avg=mean(X_30_lemes(size_prep:length(X_30_lemes),1));
v_lemes_avg=mean(X_30_lemes(size_prep:length(X_30_lemes),2));
r_lemes_avg=mean(X_30_lemes(size_prep:length(X_30_lemes),6));

%Recoil
w_lemes_avg=mean(X_30_lemes(size_prep:length(X_30_lemes),3));
q_lemes_avg=mean(X_30_lemes(size_prep:length(X_30_lemes),5));
theta_lemes_avg=mean(X_30_lemes(size_prep:length(X_30_lemes),11));


data_comprar=[u_avg u_lemes_avg;
                v_avg v_lemes_avg;
                rad2deg(r_avg) rad2deg(r_lemes_avg);
                w_avg w_lemes_avg;
                rad2deg(q_avg) rad2deg(q_lemes_avg);
                rad2deg(theta_avg) rad2deg(theta_lemes_avg)];
round(data_comprar,3)

%%
%Grafico Paper

clc
clear

%Amplitude 20º
%Frequencia 1Hz

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=15');
X_15=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=-15');
X_n15=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=30');
X_30=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=-30');
X_n30=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=45');
X_45=X;

load('TOBIAS - TURNING CIRCLE MERGE - Lastro =0 - AOA_BB=0 - AOA_EB=0 - F=100 - Amp=20 - TDA=-45');
X_n45=X;
size_prep=length(X_prep);

figure('Renderer','painters')
plot(X_15(size_prep:length(X_15),8),X_15(size_prep:length(X_15),7),'LineWidth',1,'Color',[0 0.4470 0.7410]);
hold on
plot(X_n15(size_prep:length(X_n15),8),X_n15(size_prep:length(X_n15),7),'LineWidth',1,'Color',[0 0.4470 0.7410],'LineStyle','--');
hold on;
plot(X_30(size_prep:length(X_30),8),X_30(size_prep:length(X_30),7),'LineWidth',1,'Color',[0.8500 0.3250 0.0980]);
hold on
plot(X_n30(size_prep:length(X_n30),8),X_n30(size_prep:length(X_n30),7),'LineWidth',1,'Color',[0.8500 0.3250 0.0980],'LineStyle','--');
hold on;
plot(X_45(size_prep:length(X_45),8),X_45(size_prep:length(X_45),7),'LineWidth',1,'Color',[0.9290 0.6940 0.1250]);
hold on
plot(X_n45(size_prep:length(X_n45),8),X_n45(size_prep:length(X_n45),7),'LineWidth',1,'Color',[0.9290 0.6940 0.1250],'LineStyle','--');
hold on;
plot(X_45(size_prep,8),X_45(size_prep,7),'black*','LineWidth',1);
hold on;
plot(X_45(1:size_prep,8),X_45(1:size_prep,7),'black','LineWidth',1);
xlabel('$y\mathrm{(m)}$','Interpreter','latex','FontSize',10,'FontName','times')
ylabel('$x\mathrm{(m)}$','Interpreter','latex','FontSize',10,'FontName','times')
grid on
set(gca,'TickLabelInterpreter','latex')
legend({'$\theta _{TDA}=+15^\circ$',...
        '$\theta_{TDA}=-15^\circ$',...
        '$\theta _{TDA}=+30^\circ$',...
        '$\theta_{TDA}=-30^\circ$',...
        '$\theta _{TDA}=+45^\circ$',...
        '$\theta_{TDA}=-45^\circ$'},...
        'NumColumns',3,...
        'location','northoutside',...
        'Interpreter','latex',...
        'FontSize',10,...
        'FontName','times')
set(gcf,'units','centimeters','position',[10,10,15,10])
print('comparacao_diametro_tactico_paper','-depsc');

