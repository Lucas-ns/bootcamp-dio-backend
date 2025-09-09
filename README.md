# API de Gerenciamento de Stocks
Esta é uma API RESTful simples para gerenciar informações de stocks (ações de empresas), permitindo operações de CRUD (Create, Read, Update, Delete). O projeto foi construído com Java e Spring Boot, usando um banco de dados em memória H2 para facilitar o desenvolvimento e os testes.

## 🚀 Tecnologias Utilizadas

* **Java 17+:** Linguagem de programação.
* **Spring Boot:** Framework para a criação da API.
* **Maven:** Gerenciamento de dependências e construção do projeto.
* **Spring Data JPA:** Para a persistência de dados.
* **Postgres:** Banco de dados hospedado em nuvem.
* **Springdock OpenAPI / Swagger UI:** Para documentação interativa da API.

## ⚙️ Pré-requisitos
Antes de começar, certifique-se de que você tem o seguinte instalado:

* **Java Development Kit (JDK) 17 ou superior**
* **Maven**

## 🏁 Como Rodar o Projeto
Siga estes passos para configurar e iniciar a aplicação localmente:

1. Clone o repositório:

``` Bash
git clone https://github.com/Lucas-ns/bootcamp-dio-backend
cd bootcamp-dio-backend
```

Construa o projeto com Maven:

```Bash
mvn clean install
```

Execute a aplicação:

```Bash
mvn spring-boot:run
```

A aplicação será iniciada na porta padrão ```8080```.

## 📜 Endpoints da API
A documentação interativa da API pode ser acessada através do Swagger UI após a aplicação ser iniciada:

👉 http://localhost:8080/swagger-ui.html

A seguir, os principais endpoints disponíveis:

Stocks (```/api/stocks```)
* ```GET /api/stocks```: Lista todos os stocks.
* ```GET /api/stocks/{id}```: Busca um stock específico por ID.
* ```GET /api/stocks/today```: Busca os stocks da data atual.
* ```POST /api/stocks```: Cria um novo stock.

Exemplo de body:

```JSON
{
  "name": "BBSA3",
  "price": 21.75,
  "date": "09/09/2025",
  "variation": -10.71
}
```
* ```PUT /api/stocks```: Atualiza um stock existente, se não existir é criado um novo.

Exemplo de body:

```JSON
{
  "id": 3,
  "name": "VALE3",
  "price": 50,
  "date": "09/09/2025",
  "variation": 15.0
}
```

* ```DELETE /api/stocks/{id}```: Exclui um stock por ID.