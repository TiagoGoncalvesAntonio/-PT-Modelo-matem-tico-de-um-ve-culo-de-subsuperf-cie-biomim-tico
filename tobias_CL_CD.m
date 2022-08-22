function [CL_BB, CD_BB, CL_EB, CD_EB] = tobias_CL_CD(aoa_BB, aoa_EB)
% aoa_BB - ângulo de ataque da barbatana peitoral de BB
% aoa_EB - ângulo de ataque da barbatana peitoral de EB

%Ler a tabela do perfil NACA0012
tabela_naca0012=table2array(readtable('NACA0012_CL_CD_-30_30.txt'));

%Encontrar na tabela as linhas para os ângulos de ataque pretendidos
index_BB=find(tabela_naca0012(:,1)==aoa_BB);
index_EB=find(tabela_naca0012(:,1)==aoa_EB);

%Guardar os coeficientes de lift e drag para esses angulos de ataque
CL_BB=tabela_naca0012(index_BB,2);
CD_BB=tabela_naca0012(index_BB,3);

CL_EB=tabela_naca0012(index_EB,2);
CD_EB=tabela_naca0012(index_EB,3);
end