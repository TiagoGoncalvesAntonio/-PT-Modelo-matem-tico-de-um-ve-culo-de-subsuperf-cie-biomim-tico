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
%TOBIAS - CONTROLADOR GUINADA - ANGULO ENTRE VETORES - Kp =80 - Kd =0 - x_ref =60 - y_ref =0
figure('Renderer','painters');
set(gcf,'position',[400,100,1000,800])

subplot(2,1,1)
plot(X(:,7),X(:,8),'LineWidth',2);
hold on;
plot(X(1,7),X(1,8),'*g','LineWidth',2);
hold on;
plot(X(end,7),X(end,8),'*r','LineWidth',2);
hold on
scatter(trajetoria(:,1),trajetoria(:,2),150,'y','filled','Marker','p','MarkerEdgeColor','black','LineWidth',1);
hold on
for n = 1:numel(trajetoria(:,1))
    text(trajetoria(n,1)-1.5,trajetoria(n,2),num2str(n))
    hold on
end
legend({'Trajetória do TOBIAS','Posição Inicial','Posição Final','Pontos da Trajétoria'},'Location','best','Interpreter','latex','FontName','times');

title('Trajectória do Veículo no Plano Horizontal','Interpreter','latex','FontName','times','FontWeight','normal');

box on;
xlabel('$x(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$y(\mathrm{m})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')


subplot(2,1,2)
plot(T,rad2deg(X(:,12)),'LineWidth',1);
hold on;
plot(T,rad2deg(save_TDA),'LineWidth',1,'Color','red');
legend({'Resposta do TOBIAS','\theta_{ADC}'},'Location','best','FontName','times','FontSize',10);

title(['Evolução do Ângulo de Guinada - Kp = ', num2str(Kp)],'FontName','times','FontWeight','normal');

box on;
xlabel('$t(\mathrm{s})$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
ylabel('$\psi (^\circ)$','Interpreter','latex','FontSize',14,'FontName','times','FontWeight','normal')
grid on
set(gca,'TickLabelInterpreter','latex')


file_name=['Controlo_de_guinada_plano_xy_Kp=',num2str(Kp*100)];
print(file_name,'-depsc');

% %%
% %Setup the figura
% load('Tobias.mat');
% 
% figure
% ax=axes('Xlim',[-10 10],'Ylim',[-10 10],'Zlim',[-10 10]);
% %view(3);
% grid on;
% axis equal;
% xlim([0 max(X(:,7)+5)]);
% ylim([min(X(:,8)-20) max(X(:,8)+20)]);
% % zlim([min(X(:,9)-10) max(X(:,9)+10)]);
% grid on;
% % set(gca, 'XDir','reverse');
% % set(gca, 'ZDir','reverse');
% set(gca,'Color',[0.1638 0.388 0.576]);
% set(gcf,'Name','Trajetória Tobias',...
% 	'Pointer','crosshair',... 
%     'Position',[100 100 800 600]);
% 
% %Fator de escala dos dados importados do MeshLab
% f_escala=0.005;
% 
% 
% %Inversão do Z para ficar correto e ajuste ao fator de escala
% V=[f_escala*V(:,1), f_escala*(V(:,2)), -f_escala*V(:,3)];
% 
% %Criação da figura através da função patch
% h(1)= patch( 'faces', F, 'vertices', [V(:,1)-3 V(:,2)-1 V(:,3)+0.6],...
%     'FaceColor',[0.66 0.66 0.66],'LineStyle','-','AlignVertexCenters','on','EdgeAlpha',0.01);
% 
% %Criar o objeto a partir da figura anterior
% H=hgtransform('Parent',gca);
% set(h,'Parent',H)
% 
% set(gcf,'Renderer','opengl')
% set(gcf,'position',[100,100,1000,800])
% 
% %Setup da linha do percurso
% path= animatedline('LineWidth',1.5,'Color',[1 1 0]);
% 
% %Ciclo para criar a animação
% %while true
%     for j=1:length(X(:,7))
%         view(0,90)  % XY
%         addpoints(path,X(j,7),X(j,8),X(j,9));
%         trans = makehgtform('translate',[X(j,7) X(j,8) X(j,9)]);
%         rot = makehgtform('xrotate',X(j,10),'yrotate',X(j,11),'zrotate',X(j,12));
%         set(H,'Matrix',trans*rot);
%         pause(0.008)
%         %drawnow %limitrate;
%     end
% %clearpoints(path)
% %end

