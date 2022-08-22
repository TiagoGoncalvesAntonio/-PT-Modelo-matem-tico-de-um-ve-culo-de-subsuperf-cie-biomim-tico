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
figure('Renderer','painters');
set(gcf,'position',[400,100,1000,800])

subplot(2,1,1)
plot(X(:,7),X(:,9),'LineWidth',2);
hold on;
plot(X(1,7),X(1,9),'*g','LineWidth',2);
hold on;
plot(X(end,7),X(end,9),'*r','LineWidth',2);
hold on
scatter(trajetoria(:,1),trajetoria(:,2),150,'y','filled','Marker','p','MarkerEdgeColor','black','LineWidth',1);
hold on
for n = 1:numel(trajetoria(:,1))
    text(trajetoria(n,1)-1,trajetoria(n,2)-1.5,num2str(n))
    hold on
end
ylim([-15 15])
legend({'Trajetória do TOBIAS','Posição Inicial','Posição Final','Pontos da Trajétoria'},'Location','best','Interpreter','latex','FontName','times');

title('Trajectória do Veículo no Plano Vertical','Interpreter','latex','FontName','times','FontWeight','normal');

box on;
xlabel('$x(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$z(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
set(gca, 'Ydir', 'reverse')
grid on
set(gca,'TickLabelInterpreter','latex')


subplot(2,1,2)
plot(T,rad2deg(X(:,11)),'LineWidth',1);
hold on;
plot(T,save_alpha,'LineWidth',1,'Color','red');
legend({'Resposta do TOBIAS','\alpha'},'Location','best','FontName','times','FontSize',10);

title(['Evolução do Ângulo de Cabeceio - Kp = ', num2str(Kp),' Kd = ', num2str(Kd)],'FontName','times','FontWeight','normal');

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$\theta (^\circ)$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')

file_name=['Controlo_de_profundidade_plano_xz_Kp=',num2str(Kp*100),'_Kp=',num2str(Kd*1000)];
print(file_name,'-depsc');
