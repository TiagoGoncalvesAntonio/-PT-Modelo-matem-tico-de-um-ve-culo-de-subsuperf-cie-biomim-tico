%%
%=======================Vizualização dos Resultados========================
clc
clear

load('Tobias.mat');

%=========================Importação Dos Dados=============================
[file_name,path] = uigetfile({'*.mat'}, 'Select mat file'); 

if isequal(file_name,0)
   disp('Seleção inválida ou cancelada');
else
    load(file_name);
end

%==========================================================================

%Setup the figura
figure
ax=axes('Xlim',[-1 1],'Ylim',[-0.5 0.5],'Zlim',[-0.5 0.5]);
view(3);
grid on;
axis equal;
xlim([min(X(:,7)-10) max(X(:,7)+10)]);
ylim([min(X(:,8)-10) max(X(:,8)+10)]);
zlim([min(X(:,9)-10) max(X(:,9)+10)]);
grid on;
set(gca, 'XDir','reverse');
set(gca, 'ZDir','reverse');
set(gca,'Color',[0.1638 0.388 0.576]);
set(gcf,'Name','Trajetória Tobias',...
	'Pointer','crosshair',... 
    'Position',[100 100 800 600]);

%Fator de escala dos dados importados do MeshLab
f_escala=0.005;


%Inversão do Z para ficar correto e ajuste ao fator de escala
V=[f_escala*V(:,1), f_escala*(V(:,2)), -f_escala*V(:,3)];

%Criação da figura através da função patch
h(1)= patch( 'faces', F, 'vertices', [V(:,1)-3 V(:,2)-1 V(:,3)+0.6],...
    'FaceColor',[0.66 0.66 0.66],'LineStyle','-','AlignVertexCenters','on','EdgeAlpha',0.01);

%Criar o objeto a partir da figura anterior
H=hgtransform('Parent',ax);
set(h,'Parent',H)

set(gcf,'Renderer','opengl')

%Setup da linha do percurso
path= animatedline('LineWidth',2,'Color',[1 1 0]);

%Ciclo para criar a animação
while true
    for j=1:length(X(:,7))
        addpoints(path,X(j,7),X(j,8),X(j,9));
        trans = makehgtform('translate',[X(j,7) X(j,8) X(j,9)]);
        rot = makehgtform('xrotate',X(j,10),'yrotate',X(j,11),'zrotate',X(j,12));
        set(H,'Matrix',trans*rot);
        pause(0.01)
    end
clearpoints(path)
end


