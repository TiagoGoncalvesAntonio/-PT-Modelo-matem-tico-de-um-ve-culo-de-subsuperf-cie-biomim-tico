%Ficheiro principal - Controlador de profundidade
clc
clear

%Definir os parâmetros de resolução no tempo e duração da simulação
%Resolução no tempo
delta=0.1; %Input
%Duração da simulação
last_T=250; %Input
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
save_alpha=[];
save_erro_theta=[];
save_dist_ponto=[];
save_theta_ref=[];

%Definir a trajetória pretendida 

pontos_trajetoria=[20 5;
                   40 5;
                   60 -10
                   ];

% pontos_trajetoria=[60 5];


x_ref=pontos_trajetoria(1,1);
z_ref=pontos_trajetoria(1,2);
pos_ref=[x_ref;z_ref];

trajetoria=pontos_trajetoria;

%Ganhos dos controladores
Kp=0.3; %Input
Kd=0.8; %Input

erro_old=0;
%Chamar a tabela da naca0012 para interpolar valores intremedios
tabela_naca0012=table2array(readtable('NACA0012_CL_CD_-30_30.txt'));

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
        save_alpha=[save_alpha;aoa_EB];
        save_erro_theta=[save_erro_theta;0];

        %Atualização do theta_ref a cada iteração
        xb=X0(7);
        zb=X0(9);
        pos_body=[xb;zb];
        theta_ref=atan2d(pos_ref(2)-pos_body(2),pos_ref(1)-pos_body(1));
        save_theta_ref=[save_theta_ref;0];

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
        save_alpha=[save_alpha;aoa_EB];
        rad2deg(X0(11))
        
        erro_theta=theta_ref-rad2deg(wrapToPi(X0(11))); %erro_theta sai em graus
        derivada_erro_theta=(erro_theta-erro_old)/delta;
        erro_old=erro_theta;
        
        %Atualização do theta_ref a cada iteração
        xb=X0(7);
        zb=X0(9);
        pos_body=[xb;zb];
        x_ref=pontos_trajetoria(1,1);
        z_ref=pontos_trajetoria(1,2);
        pos_ref=[x_ref;z_ref];
        theta_ref=atan2d(pos_ref(2)-pos_body(2),pos_ref(1)-pos_body(1));
        save_theta_ref=[save_theta_ref;theta_ref];
        
        %Atuação dos controladores        
        alpha=erro_theta*Kp + derivada_erro_theta*Kd;
        
        %Limites de atuação
        if alpha > 30
            alpha=30;
        elseif alpha < -30
            alpha=-30;
        end
        
        %Definir os ângulos de ataque de ambos os bordos
        aoa_EB=-alpha;
        aoa_BB=-alpha;
        
        %Importar dados da tabela NACA0012
        CL_BB=interp1(tabela_naca0012(:,1),tabela_naca0012(:,2),aoa_BB,'spline');
        CL_EB=interp1(tabela_naca0012(:,1),tabela_naca0012(:,2),aoa_EB,'spline');

        CD_BB=interp1(tabela_naca0012(:,1),tabela_naca0012(:,3),aoa_BB,'spline');
        CD_EB=interp1(tabela_naca0012(:,1),tabela_naca0012(:,3),aoa_EB,'spline');

        %Distância entre o veículo e o ponto da trajetória  
        dist_ponto=sqrt((pos_ref(1)-pos_body(1))^2+(pos_ref(2)-pos_body(2))^2);
        
        %Atualização da trajetória passado para o ponto seguinte
        if dist_ponto<0.5 && length(pontos_trajetoria(:,1))>1
            pontos_trajetoria(1,:)=[];
        %Condicao de parar o loop se chegar ao ultimo ponto da lista          
        elseif dist_ponto<0.5 && length(pontos_trajetoria(:,1))==1
            last_T=t;
            break
        end

        save_dist_ponto=[save_dist_ponto;dist_ponto];
        save_erro_theta=[save_erro_theta;erro_theta];
        
    end
      
end

T=[0:delta:last_T];
X=save_X;

%Alterar o nome do ficheiro consoante a simulação
file_name=['TOBIAS - CONTROLADOR PROFUNDIDADE - ANGULO ENTRE VETORES - TEST - Kp =', num2str(Kp*100), ' - Kd =', num2str(Kd*1000), ' - x_ref =', num2str(x_ref), ' - z_ref =', num2str(z_ref)];
save(file_name);
