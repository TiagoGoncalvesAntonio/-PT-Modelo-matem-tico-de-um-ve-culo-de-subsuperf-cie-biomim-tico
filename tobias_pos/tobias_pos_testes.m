load('Tobias.mat')
figure;
f_escala=0.001;
trisurf(F,f_escala*V(:,1), f_escala*V(:,2), f_escala*V(:,3), 'FaceColor', [0.2 0.5 0.8])
axis equal;
%axis off;
grid off;
box off;

%%
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

trajectory = [X(:,7) X(:,8) X(:,9) X(:,10) X(:,11) X(:,12)];

%%
figure
load('Tobias.mat');
f_escala=0.001;
V=[f_escala*V(:,1), f_escala*V(:,2), f_escala*V(:,3)];
patch( 'faces', F, 'vertices', V )

