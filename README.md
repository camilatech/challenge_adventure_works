# Aplicação de Data Pipeline para a Adventure Works

## Descrição do projeto:

O projeto consiste na aplicação de um pipeline de dados da empresa Adventure works (AW), em sua área de 'Compras' (Purchasing), para responder perguntas de negócio e continuar com seu crescimento.

Para isso, dividiu-se o projeto em 5 etapas:

1. Diagrama conceitual do data warehouse: criação das tabelas de fatos e dimensões necessárias para responder as perguntas de negócio relevantes para a área de 'Compras';

2. Configuração de um data warehouse: criação do data warehouse na nuvem (Bigquery) para a extração dos dados da Adventureworks;

3. Extract - Load: através do Airbyte e do acesso ao bando de dados da Adventure works, extraiu-se os dados necessários para a respostas, carregando-os no data warehouse configurando anteriormente;

4. Transformação de dados: os dados brutos, extraídos na etapa 3, foram transformados com o dbt para atender ao diagrama conceitual criado na etapa 1;

5. Criação do painel de Business Inteligence (BI): elaboração da visualização de dados. Dashboard através do Qlik Sense.

## Arquivos:

As tabelas fato e dimensões estão no formato ".sql".

A documentação das tabelas estão no formato ".yml", assim como as fontes necessárias para o dbt.


## Extract & Load


### Requisitos

Para realizar esse projeto você vai precisar:

- Instância do Airbyte rodando localmente
- Banco BigQuery rodando na nuvem
- Dbeaver

### Configurações Iniciais
Sugerimos a criação de um Virtual Enviroment para a instalação e aplicação do projeto.
Inicialmente vamos instalar os pacotes:

```
pip install -r requirements.txt
```

### Instalando o Airbyte

Para facilitar a criação do ambiente, um arquivo `docker-compose` está disponível na pasta do projeto.

Se você não tem o docker instalado na sua máquina siga essas [instruções](https://www.docker.com/products/docker-desktop).

```
docker-compose up
```
### Acessando o Airbyte

Se tudo deu certo no passo anterior, o Airbyte deverá estar rodando em [http://localhost:8000](http://localhost:8000).


### Airbyte - Extraindo de uma fonte remota 

Vamos extrair os dados de um banco de dados remoto da AdventureWorks. Para acessá-lo vamos utilizar as seguintes infos:

```
Host: 35.239.223.162
Port: 5432
User: stitch_extract
Password: etl_101_passwd
Database: Adventureworks
```

Nosso destino vai ser o nosso Data Warehouse no BigQuery! 

Vamos chamar desse banco de dados de "dw_purchasing" e nosso schema de destino de "analytics".

## Transform
### DBT
Quando a conexão com o seu banco de dados BigQuery está feita no Airflow , é só configurar o profiles.yml para fazer a conexão e o seguinte código para checagem:

```
dbt debug
```
Se todos os checks passaram, podemos seguir com  seguinte código:

```
dbt run
```
Depois disso, você terá uma nova pasta no BigQuery com os dados transformados.

## Analytics
### Qlik
Utilizamos o Qlik Cloud para esse desafio e por lá conseguimos fazer a conexão direta com o BigQuery. Com isso, conseguimos produzir o seguinte relatório:


## Autores do projeto:
Camila Bosa Custódio e Gabriel Lajús Maccarini
Inspirado no Airbyte_Tooltorial