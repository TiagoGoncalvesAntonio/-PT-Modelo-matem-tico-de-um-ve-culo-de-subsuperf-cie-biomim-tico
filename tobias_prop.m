function [dxdt_fin,dydt_fin,k_fin,w_fin,braco_yaw,trust_fin] = tobias_prop(theta_fin_amp,freq_fin,theta_fin,t)
% theta_fin_amp - amplitude de oscilação da cauda
% freq_fin - frequência de oscilação da cauda
% theta_fin - vetor das posiçõs da cauda em cada instante
% t - vetor de tempo

%Comprimento do link 
b_fin=0.254; %m
%Altura da barbatana
s_fin=0.240; %m
%Densidade da água 
rho=1025; %kg/m3
%Massa de água movimentada - Massa virtual
m_fin=(rho*pi*s_fin^2)/4; %kg/m

%Velocidades da tail tip
dxdt_fin=-b_fin.*sin(theta_fin).*theta_fin_amp.*2.*pi.*freq_fin.*cos(2.*pi.*freq_fin.*t);
dydt_fin=b_fin.*cos(theta_fin).*theta_fin_amp.*2.*pi.*freq_fin.*cos(2.*pi.*freq_fin.*t);

%Velocidadade tangenciais e perpendicular da cauda
k_fin=dydt_fin.*sin(theta_fin)+dxdt_fin.*cos(theta_fin);
w_fin=dydt_fin.*cos(theta_fin)-dxdt_fin.*sin(theta_fin);

braco_yaw_ones=ones(length(theta_fin),1);
braco_yaw=braco_yaw_ones*0.695;
braco_yaw=transpose(braco_yaw);
%braco_yaw=0.61707+b_fin.*cos(theta_fin); %m

trust_fin=m_fin.*w_fin.*k_fin.*sin(theta_fin)+0.5.*m_fin.*(w_fin.^2).*cos(theta_fin);
end