# Aplicação de Data Pipeline para a Adventure Works

## Descrição do projeto:

O projeto consiste na aplicação de um pipeline de dados da empresa Adventure works (AW), em sua área de 'Compras' (Purchasing), para responder perguntas de negócio e continuar com seu crescimento.

Para isso, dividiu-se o projeto em 5 etapas:

    1 - Diagrama conceitual do data warehouse: criação das tabelas de fatos e domensões necessárias para responder as perguntas de negócio relevantes para a área de 'Compras';

    2 - Configuração de um data warehouse: criação do data warehouse (PostgreSQL local) para a extração dos dados da Adventureworks;

    3 - Extract - Load: através do Airbyte e do acesso ao bando de dados da Adventure works, extraiu-se os dados necessários para a respostas, carregando-os no data warehouse configurando anteriormente;

    4 - Transformação de dados: os dados brutos, extraídos na etapa 3, foram transformados com o dbt para atender ao diagrama conceitual criado na etapa 1;

    5 - Criação do painel de Business Inteligence (BI): elaboração da visualização de dados. Dashboard através do Qlik Sense.

## Arquivos:

As tabelas fato e dimensões estão no formato ".sql".
A documentação das tabelas estão no formato ".yml", assim como as fontes necessárias para o dbt.




## Autores do projeto:
Camila Bosa Custódio e Gabriel Lajús Maccarini