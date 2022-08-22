%Ficheiro principal - Controlador 3D
clc
clear

%Definir os parâmetros de resolução no tempo e duração da simulação
%Resolução no tempo
delta=0.1;
%Duração da simulação
last_T=1000; 
tspan_inicial=[0:delta:last_T+delta]; %somar delta por causa das dimensões do vetor de trust

m_lastro=0; %Input

aoa_BB=0; %Input
aoa_EB=0; %Input
[CL_BB, CD_BB, CL_EB, CD_EB] = tobias_CL_CD(aoa_BB, aoa_EB);

freq_fin=1; %Input
theta_fin_amp=20; %Input

theta_fin_amp=theta_fin_amp*pi/180;
theta_fin=theta_fin_amp*sin(2*pi*freq_fin*tspan_inicial);
[dxdt_fin,dydt_fin,k_fin,w_fin,braco_yaw,trust_fin] = tobias_prop(theta_fin_amp,freq_fin,theta_fin',tspan_inicial');

tail_deflection_angle=0; %Input
tail_deflection_angle=deg2rad(tail_deflection_angle);

X0=[0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

save_X=[];
save_dist_ponto=[];

%Variaveis save para o controlo de guinada
save_TDA=[];
save_erro_psi=[];

%Variaveis save para o controlo de profundidade
save_alpha=[];
save_erro_theta=[];

%Variaveis save para o controlo de frequência de oscilação
save_freq=[];
save_erro_dist=[];

%Definir a trajetória pretendida 
pontos_trajetoria=[20 0 0;
                   20 -10 0;
                   30 -10 5
                   30 10 -5
                   40 10 5
                   40 -10 -5
                   50 -10 5
                   50 10 -5
                   60 10 5
                   60 0 0
                   70 0 0];

%pontos_trajetoria=[30 10 5];

x_ref=pontos_trajetoria(1,1);
y_ref=pontos_trajetoria(1,2);
z_ref=pontos_trajetoria(1,3);
pos_ref=[x_ref;y_ref;z_ref];

%Guardar a lista inicial, para gráficos mais tarde
trajetoria=pontos_trajetoria;

%Ganhos do controlador de guinada
Kp_guinada=0.8;
Kd_guinada=0;

%Ganhos do controlador de profundidade
Kp_profundidade=0.3;
Kd_profundidade=0.8;

%Ganhos do controlador de velocidade
Kp_velocidade=0.1;
Kd_velocidade=0;

%Tabela da naca0012 para interpolar valores intermedios
tabela_naca0012=table2array(readtable('NACA0012_CL_CD_-30_30.txt'));

erro_old_theta=0;
erro_old_psi=0;
erro_old_dist_ponto=0;

for t=0:delta:last_T
    if t<=20
        t
        
        %Obter o trust correto em cada intrevalo de tempo
        [d, idx ] = min( abs( tspan_inicial-t ) );
        freq_fin=1; %Input
        theta_fin_amp=20; %Input
        theta_fin_amp=theta_fin_amp*pi/180;
        theta_fin=theta_fin_amp*sin(2*pi*freq_fin*tspan_inicial);
        [dxdt_fin,dydt_fin,k_fin,w_fin,braco_yaw,trust_fin] = tobias_prop(theta_fin_amp,freq_fin,theta_fin',tspan_inicial');
        trust_fin_atualizado=trust_fin(idx:length(trust_fin));
        
        %Resolução do sistema de equações no tspan de (t-1) e (t)
        tspan=[0:delta:delta];
        [T X]=ode45(@tobias_eq,tspan,X0,[],braco_yaw,trust_fin_atualizado,tail_deflection_angle,m_lastro,CL_BB, CD_BB, CL_EB, CD_EB,delta);
        X0=X(length(X(:,1)),:)'; %Guardar a última linha do vetor de estado para ser usada como
        %condição inicial na iteração seguinte
        save_X=[save_X;X(length(X(:,1)),:)];
        
        %Variaveis save para o controlo de guinada
        save_TDA=[save_TDA;tail_deflection_angle];
        save_erro_psi=[save_erro_psi;0];
        
        %Variaveis save para o controlo de profundidade
        save_alpha=[save_alpha;aoa_EB];
        save_erro_theta=[save_erro_theta;0];

        %Variaveis save para o controlo de velocidade
        save_freq=[save_freq;freq_fin];
        save_erro_dist=[save_erro_dist;0];
        
        %Posição do veiculo
        xb=X0(7);
        yb=X0(8);
        zb=X0(9);
        pos_body=[xb;yb;zb];
        
        %Atualização do psi_ref a cada iteração
        psi_ref=atan2d(pos_ref(2)-pos_body(2),pos_ref(1)-pos_body(1));         
        
        %Atualização do theta_ref a cada iteração
        theta_ref=atan2d(pos_ref(3)-pos_body(3),pos_ref(1)-pos_body(1));

    else
        t

        %Obter o trust correto em cada intrevalo de tempo
        [d, idx ] = min( abs( tspan_inicial-t ) );
        theta_fin_amp=20; %Input
        theta_fin_amp=theta_fin_amp*pi/180;
        theta_fin=theta_fin_amp*sin(2*pi*freq_fin*tspan_inicial);
        [dxdt_fin,dydt_fin,k_fin,w_fin,braco_yaw,trust_fin] = tobias_prop(theta_fin_amp,freq_fin,theta_fin',tspan_inicial');
        trust_fin_atualizado=trust_fin(idx:length(trust_fin));
        
        %Resolução do sistema de equações no tspan de (t-1) e (t)
        tspan=[0:delta:delta];
        [T X]=ode45(@tobias_eq,tspan,X0,[],braco_yaw,trust_fin_atualizado,tail_deflection_angle,m_lastro,CL_BB, CD_BB, CL_EB, CD_EB,delta);
        X0=X(length(X(:,1)),:)'; %Guardar a última linha do vetor de estado para ser usada como
        %condição inicial na iteração seguinte
        save_X=[save_X;X(length(X(:,1)),:)];
        
        %Variaveis save para o controlo de guinada, profundidade e velocidade
        save_TDA=[save_TDA;tail_deflection_angle];
        save_alpha=[save_alpha;aoa_EB];
        save_freq=[save_freq;freq_fin];

        %Erro controlador de guinada       
        erro_psi=psi_ref-rad2deg(wrapToPi(X0(12))); %erro_psi sai em graus
        derivada_erro_psi=(erro_psi-erro_old_psi)/delta; %derivada do erro 
        erro_old_psi=erro_psi;
        
        %Erro controlador de profundidade
        erro_theta=theta_ref-rad2deg(wrapToPi(X0(11))); %erro_theta sai em graus
        derivada_erro_theta=(erro_theta-erro_old_theta)/delta; %derivada do erro 
        erro_old_theta=erro_theta;

        %Posição do corpo
        xb=X0(7);
        yb=X0(8);
        zb=X0(9);
        pos_body=[xb;yb;zb];
        
        %Posição do ponto de referência
        x_ref=pontos_trajetoria(1,1);
        y_ref=pontos_trajetoria(1,2);
        z_ref=pontos_trajetoria(1,3);
        pos_ref=[x_ref;y_ref;z_ref];
        
        %Atualização do psi_ref a cada iteração
        psi_ref=atan2d(pos_ref(2)-pos_body(2),pos_ref(1)-pos_body(1));
        %Atuação do controlador de guinada
        tail_deflection_angle=Kp_guinada*deg2rad(erro_psi) + Kd_guinada*deg2rad(derivada_erro_psi);
        
        %Limites de atuação do controlador de guinada
        if tail_deflection_angle > deg2rad(45)
            tail_deflection_angle=deg2rad(45);
        elseif tail_deflection_angle < deg2rad(-45)
            tail_deflection_angle=deg2rad(-45);
        end

        %Atualização do theta_ref a cada iteração
        theta_ref=atan2d(pos_ref(3)-pos_body(3),pos_ref(1)-pos_body(1));
        %Atuação do controlador de profundidade
        alpha=Kp_profundidade*erro_theta + Kd_profundidade*derivada_erro_theta;
        
        %Limites de atuação do controlador de profundidade
        if alpha > 30
            alpha=30;
        elseif alpha < -30
            alpha=-30;
        end
        
        %Definir os ângulos de ataque de ambas as barbatanas peitorais
        aoa_EB=-alpha;
        aoa_BB=-alpha;
        
        CL_BB=interp1(tabela_naca0012(:,1),tabela_naca0012(:,2),aoa_BB,'spline');
        CL_EB=interp1(tabela_naca0012(:,1),tabela_naca0012(:,2),aoa_EB,'spline');

        CD_BB=interp1(tabela_naca0012(:,1),tabela_naca0012(:,3),aoa_BB,'spline');
        CD_EB=interp1(tabela_naca0012(:,1),tabela_naca0012(:,3),aoa_EB,'spline');
        
        %Distância entre o veículo e o ponto da trajetória  
        dist_ponto=sqrt((pos_ref(1)-pos_body(1))^2+(pos_ref(2)-pos_body(2))^2+(pos_ref(3)-pos_body(3))^2);
        
        %Erro controlador de velocidade
        %É considerado que o erro_dist_ponto = dist_ponto
        derivada_erro_dist=(dist_ponto-erro_old_dist_ponto)/delta; %derivada do erro 
        erro_old_dist_ponto=dist_ponto;
        
        %Atuação do controlador de velocidade
        freq_fin=Kp_velocidade*dist_ponto+Kd_velocidade*derivada_erro_dist;

        %Limites de atuação do controlador de velocidade
        if freq_fin > 1
            freq_fin=1;
        elseif freq_fin < 0
            freq_fin=0;
        end
        
        %Atualização da trajetória passado para o ponto seguinte
        if dist_ponto<0.8 && length(pontos_trajetoria(:,1))>1
            pontos_trajetoria(1,:)=[];
        %Condicao de parar o loop se chegar ao ultimo ponto da lista       
        elseif dist_ponto<0.8 && length(pontos_trajetoria(:,1))==1
            last_T=t;
            break
        end

        save_dist_ponto=[save_dist_ponto;dist_ponto];

        save_erro_psi=[save_erro_psi;erro_psi];
        save_erro_theta=[save_erro_theta;erro_theta];
        save_erro_dist=[save_erro_dist;dist_ponto];
        
    end
       
end

T=[0:delta:last_T];
X=save_X;

%Alterar o nome do ficheiro consoante a simulação
file_name=['TOBIAS - CONTROLADOR 3D - ANGULO ENTRE VETORES - TEST - ' ...
            'Kp_guinada =', num2str(Kp_guinada*100),...
            ' - Kd_guinada =', num2str(Kd_guinada*1000),...
            ' - Kp_profundidade =', num2str(Kp_profundidade*100),...
            ' - Kd_profundidade =', num2str(Kd_profundidade*1000),...
            ' - Kp_velocidade =', num2str(Kp_velocidade*100),...
            ' - Kd_velocidade =', num2str(Kd_velocidade*1000),...
            ' - x_ref =', num2str(x_ref), ' - y_ref =', num2str(y_ref), ' - z_ref =', num2str(z_ref)];
save(file_name);
