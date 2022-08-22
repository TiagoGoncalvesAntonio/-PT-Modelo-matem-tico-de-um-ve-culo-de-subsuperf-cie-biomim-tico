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

trajectory = [X(:,7) X(:,8) X(:,9) X(:,11) X(:,12) X(:,10)];


% PARAMETERS:
%
%    filename    : output set file name (*.mat)
%    matrix      : array of kinematic vectors data,
%                  matrix(:,1) - x Cartesian coordinate vector,
%                  matrix(:,2) - y Cartesian coordinate vector,
%                  matrix(:,3) - z Cartesian coordinate vector,
%                  matrix(:,4) - pitch angle vector [rad],
%                  matrix(:,5) - yaw angle vector [rad],
%                  matrix(:,6) - roll angle vector [rad]
%
% OPTIONAL ARGUMENTS:
%
%    'alpha'     : alpha channel value (0-1 - default 1)
%    'edge'      : model edge color ([R G B] - default [.4 .4 .4])
%    'face'      : model face color ([R G B] - default [.5 .5 .5])
%    'model'     : 3d model file name (string - default 'missile.mat')
%    'path'      : trajectory line visibility on/off ('on','off' - default 'on')
%    'pathcolor' : trajectory line color ([R G B] - default [.3 .3 .3])
%    'pathwidth' : trajectory line width (default 1)
%    'scale'     : model scale (default 1)

new_object('Tobias_teste.mat',trajectory,...
            'model','Tobias.mat','scale',0.001,...
            'edge',[0 0.1 0.8],'face',[0 0.1 0.8],'alpha',1,...
            'path','on','pathcolor',[.89 .0 .27],'pathwidth',1);

% PARAMETERS:
%
%    object_x    : object data set produced by 'new_object' function,
%                  use command 'help new_object' to get more information
%
% OPTIONAL ARGUMENTS:
%
%    'animate'   : animation on/off ('on','off' - default 'off')
%    'axis'      : axes visibility ('on','off' - default 'on')
%    'axiscolor' : axes and axes font color ([R G B] - default [0 0 0])
%    'color'     : display area color ([R G B] - default [1 1 1])
%    'dpi'       : dpi value (75,150,300,600 - default 150)
%    'font'      : font name (string - default 'Times New Roman')
%    'fontsize'  : font size (default 12)
%    'output'    : output file name (string - default 'none')
%    'step'      : model repetition density (default 10)
%    'view'      : camera view angles ([azimuth elevation] - default [15 30])
%    'window'    : display area size ([width height] - default [800 600])
%    'xlim'      : x axes limits ([min max] or 'off' - default 'off')
%    'ylim'      : y axes limits ([min max] or 'off' - default 'off')
%    'zlim'      : x axes limits ([min max] or 'off' - default 'off')

flypath('Tobias_teste.mat',...
        'animate','off','step',1,...
        'axis','on','axiscolor',[0 0 0],'color',[1 1 1],...
        'output','Tobias_teste_trajectoria.png');

%%
%  % load 3d model from obj file and convert it to mat format
% model_import('balloon.obj');
%  
% % simple model presentation
% model_show('balloon.mat');
%  
% % display model with extra parameter set
% model_show('balloon.mat',...
% 'face',[.89 .0 .27],'edge',[.89 .0 .27],'alpha',.5,...
% 'window',[800 400],'color',[1 1 1],'view',[15 30],...
% 'animate','off','output','balloon.png','dpi',600);
%  
% % animation example
% model_show('balloon.mat',...
% 'animate','on','output','animated_balloon.gif',...
% 'face',[.89 .0 .27],'edge','none',...
% 'window',[300 310]); 