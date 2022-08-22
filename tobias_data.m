%tobias_data
%Informação do veículo

%=========================Dados do Veículo ================================

%Massa do veículo (kg) - Confirmar este valor
m=27.92;

%Volume deslocado (m3)
nabula=27.24*10^-3;

%=========================Posição do CG (m)================================
%Assumindo que este é a origem
rgx=0;
rgy=0;
rgz=0;
%rg=[rgx rgy rgz];

%==================Posição do CI relativo ao CG (m)========================
rbx=0;
rby=0;
rbz=-0.0846;
%rb=[rbx rby rbz];


%======================Momentos de inércia (kgm3)==========================
%Dados importados do SolidWorks

Ixx=0.16;
Ixy=0;
Ixz=0.02;

Iyx=Ixy;
Iyy=0.92;
Iyz=0;

Izx=Ixz;
Izy=Iyz;
Izz=0.91;

I=[Ixx Ixy Ixz;
   Iyx Iyy Iyz;
   Izx Izy Izz];

%====================Matriz de Inércia - Corpo Rígido======================
MRB=[m 0 0 0 m*rgz -m*rgy;
     0 m 0 -m*rgz 0 m*rgx;
     0 0 m m*rgy -m*rgx 0;
     0 -m*rgz m*rgy Ixx Ixy Ixz;
     m*rgz 0 -m*rgx Iyx Iyy Iyz;
     -m*rgy m*rgx 0 Izx Izy Izz];

%=====================Coeficientes de Massa Adiconada====================== 
%(Hydrodynamic Derivatives)

%Aproximação do corpo a uma elipsoide de revolução (Prolate Spheroid)
%Devido às suas simetrias e considerando que o veículo atinge baixas
%velocidades uma boa aproximação será a seguinte matriz diagonal

%rho - Densidade da água (kg/m^3)
%a - meio comprimento longitudional da elipsoide (m)
%b - meio comprimento transversal da elipsoide (m)
a=0.4816;
b=0.102;
rho=1025;
%e - excentricidade da elipsoide
e=1-(b/a)^2;

%alfa e beta zero - são constantes associadas à forma
alfa_zero=((2*(1-e^2))/e^3)*(0.5*log((1+e)/(1-e))-e);
beta_zero=(1/e^2)-((1-e^2)/(2*e^3))*log((1+e)/(1-e));

%Coeficientes de massa adicionada
Xud=-(alfa_zero/(2-alfa_zero))*m;
Yvd=-(beta_zero/(2-beta_zero))*m;
Zwd=Yvd;
Kpd=0;
Nrd=-((1/5)*(((b^2-a^2)^2)*(alfa_zero-beta_zero))/(2*(b^2-a^2)+(b^2+a^2)*(beta_zero-alfa_zero)))*m;
Mqd=Nrd;

%==================Matriz de Inércia - Massa Adicionada====================
MA=zeros(6);
MA(1,1)=Xud;
MA(2,2)=Yvd;
MA(3,3)=Zwd;
MA(4,4)=Kpd;
MA(5,5)=Mqd;
MA(6,6)=Nrd;

%===========================Matriz de Inércia==============================
M=MRB+MA;
M_inv=inv(M);

%=========================Coeficientes de Atrito===========================
%Elipsoide de revolução - corpo
%Coeficiente de drag
Cd_corpo=0.2;
%Area da secção (cross-section area)
Acorpo_xz=0.17;
Acorpo_xy=0.17;
Acorpo_yz=0.03;

%Acoplamento e pega
%Coeficiente de drag
Cd_ap=1.2;
%Area da secção (cross-section area)
Aap_xz=0.008;
Aap_xy=0.016;
Aap_yz=0.002;
%Braço
ap_x=0.009;
ap_z=0.124;

%Base dos sensores
%Coeficiente de drag
Cd_bs=1.2;
%Area da secção (cross-section area)
Abs_xz=0.005;
Abs_xy=0.005;
Abs_yz=0.002;
%Braço
bs_x=0.251;
bs_z=0.114;

%Barbatana dorsal
%Coeficiente de drag
Cd_bd=1.2;
%Area da secção (cross-section area)
Abd_xz=0.008;
Abd_xy=0.005;
Abd_yz=0.004;
%Braço
bd_x=0.021;
bd_z=0.167;

%Barbatana caudal
%Coeficiente de drag
Cd_bc=0.5;
%Area da secção (cross-section area) 
Abc_xz=0.013;
Abc_xy=0.002;
Abc_yz=0.002;
%Braço
bc_x=0.595;
bc_z=0.007;


%Cálculo de "pré-coeficientes" para multiplicarem pela velocidade de acordo
%com a equação %f=(1/2)*rho*Cd*A*abs(u)*u

Xuu_pre=-(1/2)*rho*(Cd_corpo*Acorpo_yz + Cd_bd*Abd_yz + Cd_ap*Aap_yz + Cd_bs*Abs_yz);

Yvv_pre=-(1/2)*rho*(Cd_corpo*Acorpo_xz + Cd_bd*Abd_xz + Cd_ap*Aap_xz + Cd_bs*Abs_xz+Cd_bc*Abc_xz);

Zww_pre=-(1/2)*rho*(Cd_corpo*Acorpo_xy + Cd_bc*Abc_xy);

Kpp_pre=-(1/2)*rho*(Cd_bd*Abd_xz*bd_z^3 + Cd_ap*Aap_xz*ap_z^3 + Cd_bs*Abs_xz*bs_z^3 + Cd_bc*Abc_xz*bc_z^3);

Mqq_pre=-(1/2)*rho*(Cd_bd*Abd_xy*bd_x^3 + Cd_ap*Aap_xy*ap_x^3 + Cd_bs*Abs_xy*bs_x^3 + Cd_bc*Abc_xy*bc_x^3);

Nrr_pre=-(1/2)*rho*(Cd_bd*Abd_xz*bd_x^3 + Cd_ap*Aap_xz*ap_x^3 + Cd_bs*Abs_xz*bs_x^3 + Cd_bc*Abc_xz*bc_x^3);

Xqq_pre=(1/2)*rho*(Cd_bd*Abd_yz*bd_z^2 + Cd_ap*Aap_yz*ap_z^2 - Cd_bs*Abs_yz*bs_z^2 + Cd_bc*Abc_yz*bc_z^2);

Ypp_pre=(1/2)*rho*(-Cd_bd*Abd_xz*bd_z^2 - Cd_ap*Aap_xz*ap_z^2 + Cd_bs*Abs_xz*bs_z^2 - Cd_bc*Abc_xz*bc_z^2);

Yrr_pre=(1/2)*rho*(-Cd_bd*Abd_xz*bd_x^2 - Cd_ap*Aap_xz*ap_x^2 - Cd_bs*Abs_xz*bs_x^2 + Cd_bc*Abc_xz*bc_x^2);

Zqq_pre=(1/2)*rho*(Cd_bd*Abd_xy*bd_x^2 + Cd_ap*Aap_xy*ap_x^2 + Cd_bs*Abs_xy*bs_x^2 - Cd_bc*Abc_xy*bc_x^2);

Muu_pre=(1/2)*rho*(Cd_bd*Abd_yz*bd_z + Cd_ap*Aap_yz*ap_z - Cd_bs*Abs_yz*bs_z + Cd_bc*Abc_yz*bc_z);

Kvv_pre=(1/2)*rho*(-Cd_bd*Abd_xz*bd_z - Cd_ap*Aap_xz*ap_z + Cd_bs*Abs_xz*bs_z - Cd_bc*Abc_xz*bc_z);

Mww_pre=(1/2)*rho*(Cd_bd*Abd_xy*bd_x + Cd_ap*Aap_xy*ap_x + Cd_bs*Abs_xy*bs_x - Cd_bc*Abc_xy*bc_x);

Nvv_pre=(1/2)*rho*(-Cd_bd*Abd_xz*bd_x - Cd_ap*Aap_xz*ap_x - Cd_bs*Abs_xz*bs_x + Cd_bc*Abc_xz*bc_x);

%=========================Forças Hidroestáticas===========================
%Peso é calculado na função das equações para ter o lastro como controlo
%W=m*9.81;
B=m*9.81;
%Assumindo B=W











