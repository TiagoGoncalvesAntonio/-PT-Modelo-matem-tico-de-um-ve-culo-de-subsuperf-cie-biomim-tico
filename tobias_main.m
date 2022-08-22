%Ficheiro principal 
clc
clear

%Definir os parâmetros de resolução no tempo e duração da simulação

%Resolução no tempo
delta=0.001; %Input
%Duração da simulação
tspan=[0:delta:40]; %Input

%========================Foças Hidrostáticas===============================
%Controlo do lastro 
%Se m_lastro=0 kg veículo em equilibio; >0 afunda; <0 ascende devido à
%orientação do eixo Z

%Neste trabalho definiu-se como default o lastro =0 pois foi assumido que o
%veículo se encontra em equilibrio hidroestatico W=B
m_lastro=0; %Input

%No futuro caso necessário podem ser feitos ajustes neste valor

%===========================Barbatanas Peitorais===========================
%Controlo do ângulo de ataque das barbatanas peitorais aot-angle of attack
%Importante: escolher valores que existam no ficheiro naca.txt
%De momento vão de -30º a 30º
%AOA<0 dive AOA>0 ascend

%Guina BB - Negativo
aoa_BB=0; %Input
%Guina EB - Positivo
aoa_EB=0; %Input

[CL_BB, CD_BB, CL_EB, CD_EB] = tobias_CL_CD(aoa_BB, aoa_EB);

%==================Parâmetros Propulsão Undulatória========================
%Frequencia de oscilação da barbatana caudal (Hz)
freq_fin=1; %Input

%Amplitude em graus da oscilação da barbatana caudal para cada bordo(º)
theta_fin_amp=20; %Input
theta_fin_amp=theta_fin_amp*pi/180;

%Função da variação do ângulo de oscilação da cauda simulando o output de
%um motor elétrico
theta_fin=theta_fin_amp*sin(2*pi*freq_fin*tspan);

%Função externa para calcular o trust da barbatana caudal
%Atenção ao theta_fin e tspan entrarem na forma de coluna
[dxdt_fin,dydt_fin,k_fin,w_fin,braco_yaw,trust_fin] = tobias_prop(theta_fin_amp,freq_fin,theta_fin',tspan');

%Angulo de desfasamento da cauda relativamente à linha central do veículo(º)
%>0 Guina EB || <0 Guina BB
tail_deflection_angle=0; %Input
tail_deflection_angle=tail_deflection_angle*pi/180;

%==============================ODE Solver==================================
%Condições iniciais
X0=[0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]; %Input

%Resolver o sistema de equações
[T X]=ode45(@tobias_eq,tspan,X0,[],braco_yaw,trust_fin,tail_deflection_angle,m_lastro,CL_BB, CD_BB, CL_EB, CD_EB,delta);

%==========================================================================

%Alterar o nome do ficheiro consoante a simulação
file_name=['TOBIAS - FWD MOTION - Lastro =',num2str(m_lastro*100),...
    ' - AOA_BB=',num2str(aoa_BB),' - AOA_EB=',num2str(aoa_EB),...
    ' - F=',num2str(freq_fin*100),' - Amp=',num2str(rad2deg(theta_fin_amp)),...
    ' - TDA=',num2str(rad2deg(tail_deflection_angle))];

save(file_name);
