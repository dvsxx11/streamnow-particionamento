# 🧩 StreamNow – Particionamento de Dados no PostgreSQL

## 📘 Descrição do Projeto
Este projeto tem como objetivo aplicar técnicas de **particionamento de dados** no banco de dados da plataforma fictícia **StreamNow**, um serviço de streaming que enfrenta problemas de desempenho e manutenção devido ao grande volume de informações de **usuários** e **reproduções**.

A atividade foi desenvolvida como prática da disciplina de **Banco de Dados**, utilizando o **PostgreSQL** para demonstrar estratégias de particionamento adequadas para cenários reais de alto volume de dados.

---

## 🏢 Cenário
A StreamNow possui:
- Milhões de **usuários** cadastrados de mais de 40 países;
- Bilhões de **reproduções** de vídeos registradas diariamente.

O time de engenharia identificou lentidão nas consultas e dificuldades na manutenção do banco de dados, decidindo adotar **particionamento de tabelas** para melhorar o desempenho e facilitar o gerenciamento de dados históricos.

---

## ⚙️ Estratégias de Particionamento

### 🧍‍♂️ Tabela `usuarios`
- **Tipo de particionamento:** `RANGE`
- **Coluna usada:** `data_cadastro`
- **Justificativa:**  
  A maioria das consultas da equipe de marketing envolve o crescimento de cadastros ao longo do tempo e comparações entre meses. O particionamento por intervalo de **datas de cadastro** facilita essas análises e melhora o desempenho em consultas filtradas por períodos (ex: cadastros por mês ou trimestre).

### 🎬 Tabela `reproducoes`
- **Tipo de particionamento:** `RANGE`
- **Coluna usada:** `data_reproducao`
- **Justificativa:**  
  Como há milhões de reproduções diárias e o time de BI realiza consultas por **mês ou período**, o particionamento por **data de reprodução** facilita tanto a análise mensal (ex: total de horas assistidas por mês) quanto a **manutenção**, permitindo arquivar dados antigos de forma simples.

---

## 📂 Estrutura do Projeto

streamnow-particionamento/

│
├── scripts/

  │ ├── 01_create_tables.sql # Criação das tabelas principais particionadas

  │ ├── 02_create_partitions.sql # Criação das partições (RANGE por data)

  │ ├── 03_inserts.sql # Inserção de registros de exemplo

  │ ├── 04_queries.sql # Consultas práticas de verificação

│
├── prints/

  │ ├── query_usuarios.png # Resultado das consultas na tabela usuarios

  │ ├── query_reproducoes.png # Resultado das consultas na tabela reproducoes

│
└── README.md # Descrição e justificativa do projeto


---

## 🧠 Consultas Realizadas
```sql
select tableoid::regclass AS particao, *
from usuarios;

select tableoid::regclass AS particao, *
from reproducoes;

```
---


## 🚀 Benefícios do Particionamento

✅ Melhor desempenho em consultas por período;

✅ Facilidade na manutenção e arquivamento de dados antigos;

✅ Redução do tempo de leitura e carga nas tabelas principais;

✅ Escalabilidade para grandes volumes de dados.

---


## 🧑‍💻 Tecnologias Utilizadas

- PostgreSQL 15+
- SQL
- GitHub

---

- **Davi Silva Soares**
- **Estudante de Engenharia de Software**
- **Centro Universitário Santo Agostinho**
