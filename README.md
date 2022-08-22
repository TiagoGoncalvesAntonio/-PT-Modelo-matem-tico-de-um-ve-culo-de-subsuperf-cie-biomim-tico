# Modelo Matemático De Um Veículo De Subsuperfície Biomimético

Neste repositório é apresentado o código desenvolvido ao longo do meu trabalho final de dissertação de mestrado, no qual, no âmbito do projeto SABUVIS, se procurou modelar matematicamente o comportamento do veículo de subsuperfície biomimético TOBIAS.

<p align="center">
  <img src="https://user-images.githubusercontent.com/110428731/185928316-b9b63c95-5a4e-4874-9855-e27401cb4121.png" width="774" height="436">
</p>

## Descrição
Este trabalho encontra-se inserido no projeto SABUVIS e tem como objetivo desenvolver o modelo matemático de uma unidade executante, denominada TOBIAS. Nesse sentido, pretende-se calcular os correspondentes coeficientes hidrodinâmicos, modelar a sua propulsão biomimética, bem como os efeitos das barbatanas peitorais, procurando simular o seu comportamento dinâmico. Através deste modelo, será possível analisar a resposta do TOBIAS, em função dos diferentes parâmetros de controlo, sendo para tal, realizadas diversas simulações numéricas tanto em cadeia aberta, verificando o seu comportamento num conjunto de manobras, como em cadeia fechada, testando a aptidão do modelo para o desenvolvimento e implementação de algoritmos de controlo.

## Código
O modelo foi desenvolvido e programado em Matlab, sendo composto pelos seguintes scripts.

* **tobias_data.m** - Script com valores constantes do veículo.
* **tobias_CL_CD.m** - Função para ler na tabela NACA0012 os coeficientes de sustentação e de arrasto dos respetivos ângulos de ataque das barbatanas peitorais.
* **tobias_prop.m** - Função para o calculo estimado da força de impulso gerada pela cauda
* **tobias_eq.m** - Função para a resolução das equações de dinâmica e cinemática do veículo. 
* **tobias_main.m** - Script principal utilizando nas simulações em cadeia aberta, onde são integrados os dados provenientes dos ficheiros anteriores e definidos os parâmetros de controlo da simulação. Para realizar simulações em cadeia aberta basta correr este script com os parâmetros pretendidos.

* **tobias_main_controlador_guinada.m** -
* **tobias_main_controlador_profundidade.m** -
* **tobias_main_controlador_3d.m** -
* **tobias_pos** - Nesta pasta encontram-se todos os scripts de pós processamento e visualização dos dados resultantes das simulações realizadas ao longo do trabalho.

## Autor

Tiago Gonçalves António

email: tiagoantonio27@gmail.com

