%Ficheiro principal - Controlador de guinada
clc
clear

%Definir os parâmetros de resolução no tempo e duração da simulação
%Resolução no tempo
delta=0.1; %Input
%Duração da simulação
last_T=200; %Input
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
save_TDA=[];
save_erro_psi=[];
save_dist_ponto=[];
save_psi_ref=[];

%Definir a trajetória pretendida 

% pontos_trajetoria=[20 10;
%                    20 -10;
%                    40 5;
%                    60 0
%                    ];

%  pontos_trajetoria=[40 10;
%                    ];

pontos_trajetoria=[10 1];

x_ref=pontos_trajetoria(1,1);
y_ref=pontos_trajetoria(1,2);
pos_ref=[x_ref;y_ref];

trajetoria=pontos_trajetoria;

%Ganhos dos controladores
Kp=0.8; %Input
Kd=0; %Input

erro_old=0;

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

        tspan=[0:delta:delta];
        [T X]=ode45(@tobias_eq,tspan,X0,[],braco_yaw,trust_fin_atualizado,tail_deflection_angle,m_lastro,CL_BB, CD_BB, CL_EB, CD_EB,delta);
        X0=X(length(X(:,1)),:)'; %Guardar a última linha do vetor de estado para ser usada como
        %condição inicial na iteração seguinte
        save_X=[save_X;X(length(X(:,1)),:)];
        save_TDA=[save_TDA;tail_deflection_angle];
        save_erro_psi=[save_erro_psi;0];

        %Atualização do psi_ref a cada iteração
        xb=X0(7);
        yb=X0(8);
        pos_body=[xb;yb];
        psi_ref=atan2d(pos_ref(2)-pos_body(2),pos_ref(1)-pos_body(1))
        save_psi_ref=[save_psi_ref;0];

    else
        t

        %Obter o trust correto em cada intrevalo de tempo
        [d, idx ] = min( abs( tspan_inicial-t ) );
        freq_fin=1; %Input
        theta_fin_amp=20; %Input
        theta_fin_amp=theta_fin_amp*pi/180;
        theta_fin=theta_fin_amp*sin(2*pi*freq_fin*tspan_inicial);
        [dxdt_fin,dydt_fin,k_fin,w_fin,braco_yaw,trust_fin] = tobias_prop(theta_fin_amp,freq_fin,theta_fin',tspan_inicial');
        trust_fin_atualizado=trust_fin(idx:length(trust_fin));

        tspan=[0:delta:delta];
        [T X]=ode45(@tobias_eq,tspan,X0,[],braco_yaw,trust_fin_atualizado,tail_deflection_angle,m_lastro,CL_BB, CD_BB, CL_EB, CD_EB,delta);
        X0=X(length(X(:,1)),:)'; %Guardar a última linha do vetor de estado para ser usada como
        %condição inicial na iteração seguinte
        save_X=[save_X;X(length(X(:,1)),:)];
        save_TDA=[save_TDA;tail_deflection_angle];
       
        erro_psi=psi_ref-rad2deg(wrapToPi(X0(12))); %erro_psi sai em graus
        derivada_erro_psi=(erro_psi-erro_old)/delta;
        erro_old=erro_psi;
        
        %Atualização do psi_ref a cada iteração
        xb=X0(7);
        yb=X0(8);
        pos_body=[xb;yb];
        x_ref=pontos_trajetoria(1,1);
        y_ref=pontos_trajetoria(1,2);
        pos_ref=[x_ref;y_ref];
        psi_ref=atan2d(pos_ref(2)-pos_body(2),pos_ref(1)-pos_body(1))
        save_psi_ref=[save_psi_ref;psi_ref];

        %Atuação dos controladores
        tail_deflection_angle=deg2rad(erro_psi*Kp) + Kd*deg2rad(derivada_erro_psi);
        
        %Limites de atuação
        if tail_deflection_angle > deg2rad(45)
            tail_deflection_angle=deg2rad(45);
        elseif tail_deflection_angle < deg2rad(-45)
            tail_deflection_angle=deg2rad(-45);
        end

        %Distância entre o veículo e o ponto da trajetória       
        dist_ponto=sqrt((pos_ref(1)-pos_body(1))^2+(pos_ref(2)-pos_body(2))^2);
        
        %Atualização da trajetória passado para o ponto seguinte
        if dist_ponto<0.5 && length(pontos_trajetoria(:,1))>1
            pontos_trajetoria(1,:)=[];
        %Condicao de parar o loop se chegar ao último ponto da trajetória          
        elseif dist_ponto<0.5 && length(pontos_trajetoria(:,1))==1
            last_T=t;
            break
        end

        save_dist_ponto=[save_dist_ponto;dist_ponto];
        save_erro_psi=[save_erro_psi;erro_psi];
        
    end
end

T=[0:delta:last_T];
X=save_X;

%Alterar o nome do ficheiro consoante a simulação
file_name=['TOBIAS - CONTROLADOR GUINADA - ANGULO ENTRE VETORES - Kp =', num2str(Kp*100), ' - Kd =', num2str(Kd*1000), ' - x_ref =', num2str(x_ref), ' - y_ref =', num2str(y_ref)];
save(file_name);
