function dxdt=tobias_eq(t,X,braco_yaw,trust_fin,tail_deflection_angle,m_lastro,CL_BB, CD_BB, CL_EB, CD_EB,delta)
% t - vetor de tempo
% X - vetor de estado
% braco_yaw - braço de guinada
% trust_fin - impulso gerado pela cauda
% tail_deflection_angle - ângulo de desfasamento da cauda
% m_lastro - massa do lastro (default 0)
% CL_BB - coeficiente de sustentação BB
% CD_BB - coeficiente de arrasto BB
% CL_EB - coeficiente de sustentação EB
% CD_EB - coeficiente de arrasto EB
% delta - resolução no tempo

tc=fix(t/delta)+1;
tobias_data;

%X=[u;v;w;p;q;r;x;y;z;phi;theta;psi]
% u=X(1);
% v=X(2);
% w=X(3);
% p=X(4);
% q=X(5);
% r=X(6);
% x=X(7);
% y=X(8);
% z=X(9);
% phi=X(10);
% theta=X(11);
% psi=X(12);

%Ângulos de Euler:phi, theta, psi 
cphi=cos(X(10));
ctheta=cos(X(11));
cpsi=cos(X(12));
sphi=sin(X(10));
stheta=sin(X(11));
spsi=sin(X(12));

%Matriz transformação para velocidades lineares
R_n_b=[cpsi*ctheta -spsi*cphi+cpsi*stheta*sphi spsi*sphi+cpsi*cphi*stheta;
       spsi*ctheta cpsi*cphi+sphi*stheta*spsi -cpsi*sphi+stheta*spsi*cphi;
       -stheta ctheta*sphi ctheta*cphi];

%Matriz transformação para velocidades angulares
T_n_b=[1 sphi*(stheta/ctheta) cphi*(stheta/ctheta);
       0 cphi -sphi;
       0 sphi/ctheta cphi/ctheta];

%Matriz transformação BODY-NET final
T=zeros(6);
T(1:3,1:3)=R_n_b;
T(4:6,4:6)=T_n_b;

%=========================Forças Hidroestáticas============================
W=(m+m_lastro)*9.81;

%==================Matriz de coriolis e Força Centrípeta===================

%Rigid Body

CRB=[0 0 0 m*(rgy*X(5)+rgz*X(6)) -m*(rgx*X(5)-X(3)) -m*(rgx*X(6)+X(2));
     0 0 0 -m*(rgy*X(4)+X(3)) m*(rgz*X(6)+rgx*X(4)) -m*(rgy*X(6)-X(1));
     0 0 0 -m*(rgz*X(4)-X(2)) -m*(rgz*X(5)+X(1)) m*(rgx*X(4)+rgy*X(5));
     -m*(rgy*X(5)+rgz*X(6)) m*(rgy*X(4)+X(3)) m*(rgz*X(4)-X(2)) 0 -Iyz*X(5)-Ixz*X(4)+Izz*X(6) Iyz*X(6)+Ixy*X(4)-Iyy*X(5);
     m*(rgx*X(5)-X(3)) -m*(rgz*X(6)+rgx*X(4)) m*(rgz*X(5)+X(1)) Iyz*X(5)+Ixz*X(4)-Izz*X(6) 0 -Ixz*X(6)-Ixy*X(5)+Ixx*X(4);
     m*(rgx*X(6)+X(2)) m*(rgy*X(6)-X(1)) -m*(rgx*X(4)+rgy*X(5)) -Iyz*X(6)-Ixy*X(4)+Iyy*X(5) Ixz*X(6)+Ixy*X(5)-Ixx*X(4) 0];

%Added Mass

cor_a1=-(MA(1,1)*X(1)+MA(1,2)*X(2)+MA(1,3)*X(3)+MA(1,4)*X(4)+MA(1,5)*X(5)+MA(1,6)*X(6));
cor_a2=-(MA(2,1)*X(1)+MA(2,2)*X(2)+MA(2,3)*X(3)+MA(2,4)*X(4)+MA(2,5)*X(5)+MA(2,6)*X(6));
cor_a3=-(MA(3,1)*X(1)+MA(3,2)*X(2)+MA(3,3)*X(3)+MA(3,4)*X(4)+MA(3,5)*X(5)+MA(3,6)*X(6));
cor_b1=-(MA(4,1)*X(1)+MA(4,2)*X(2)+MA(4,3)*X(3)+MA(4,4)*X(4)+MA(4,5)*X(5)+MA(4,6)*X(6));
cor_b2=-(MA(5,1)*X(1)+MA(5,2)*X(2)+MA(5,3)*X(3)+MA(5,4)*X(4)+MA(5,5)*X(5)+MA(5,6)*X(6));
cor_b3=-(MA(6,1)*X(1)+MA(6,2)*X(2)+MA(6,3)*X(3)+MA(6,4)*X(4)+MA(6,5)*X(5)+MA(6,6)*X(6));

CA=[0 0 0 0 -cor_a3 cor_a2;
    0 0 0 cor_a3 0 -cor_a1;
    0 0 0 -cor_a2 cor_a1 0;
    0 -cor_a3 cor_a2 0 -cor_b3 cor_b2;
    cor_a3 0 -cor_a1 cor_b3 0 -cor_b1;
    -cor_a2 cor_a1 0 -cor_b2 cor_b1 0];

%Matriz final
C=CRB+CA;

%==========================Forças Hidroestáticas===========================
g_eta=[(W-B)*stheta;
       -(W-B)*ctheta*sphi;
       -(W-B)*ctheta*cphi;
       -(rgy*W-rby*B)*ctheta*cphi+(rgz*W-rbz*B)*ctheta*sphi;
       (rgz*W-rbz*B)*stheta+(rgx*W-rbx*B)*ctheta*cphi;
       -(rgx*W-rbx*B)*ctheta*sphi-(rgy*W-rby*B)*stheta];

g_eta=[g_eta;
       zeros(6,1)];
%======================Matriz de amortecimento/atrito======================

%f=(1/2)*rho*Cd*A*abs(u)*u

Xuu=Xuu_pre*abs(X(1));
Xqq=Xqq_pre*abs(X(5));

Yvv=Yvv_pre*abs(X(2));
Ypp=Ypp_pre*abs(X(4));
Yrr=Yrr_pre*abs(X(6));

Zww=Zww_pre*abs(X(3));
Zqq=Zqq_pre*abs(X(5));

Kvv=Kvv_pre*abs(X(2));
Kpp=Kpp_pre*abs(X(4));

Muu=Muu_pre*abs(X(1));
Mww=Mww_pre*abs(X(3));
Mqq=Mqq_pre*abs(X(5));

Nvv=Nvv_pre*abs(X(2));
Nrr=Nrr_pre*abs(X(6));

D=[Xuu 0 0 0 Xqq 0;
   0 Yvv 0 Ypp 0 Yrr;
   0 0 Zww 0 Zqq 0;
   0 Kvv 0 Kpp 0 0;
   Muu 0 Mww 0 Mqq 0;
   0 Nvv 0 0 0 Nrr];

D=-D;

%=============================Forças Externas==============================

%==========================Barbatanas Peitorais============================
%Propriedades Geométricas da Barbata Peitoral
chord=0.225;
span=0.105;
area_naca0012=chord*span;

%Distâncias do CG ao CP dos lemes
rx_fin=0.249;
ry_fin=0.158;
rz_fin=0.006;

%Forças de Lift e Drag BB e EB
Lift_BB=0.5*rho*area_naca0012*X(1)^2*CL_BB;
Drag_BB=0.5*rho*area_naca0012*X(1)^2*CD_BB;

Lift_EB=0.5*rho*area_naca0012*X(1)^2*CL_EB;
Drag_EB=0.5*rho*area_naca0012*X(1)^2*CD_EB;

%=============================Vetor Tau====================================
tau=zeros(12,1);

tau(1)=trust_fin(tc)*cos(tail_deflection_angle) - Drag_BB - Drag_EB;

tau(2)=trust_fin(tc)*sin(tail_deflection_angle);

tau(3)=-Lift_BB - Lift_EB;

tau(4)=Lift_BB*ry_fin - Lift_EB*ry_fin;

tau(5)=Lift_BB*rx_fin - Drag_BB*rz_fin + Lift_EB*rx_fin - Drag_EB*rz_fin;

tau(6)=trust_fin(tc)*sin(tail_deflection_angle)*braco_yaw(tc) - Drag_BB*ry_fin + Drag_EB*ry_fin;

%===========================Sistema de Equações============================
%O sistema será constituido pelas duas equações seguintes na sua forma matricial:
%vdot=M_inv[tau-C(v)*v-D(v)*v+g_eta(eta)
%etadot=T(eta)*v
%Será colocado na forma xdot=A*X+B*tau

A=[M_inv*(-C-D) zeros(6);
   T zeros(6)];

B=[M_inv zeros(6);
    zeros(6) zeros(6)];

dxdt=A*X-B*g_eta+B*tau;








