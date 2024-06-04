# Go-Lang Full Cycle clean architecture module
Repositório para implementação do módulo de clean architecture do curso Go-Expert da Full Cycle

## Desafio
Olá devs!

Agora é a hora de botar a mão na massa. Pra este desafio, você precisará criar o useCase de listagem das orders.

Esta listagem precisa ser feita com:
- Endpoint REST (GET /order)
- Service ListOrders com GRPC
- Query ListOrders GraphQL

Não esqueça de criar as migrações necessárias e o arquivo api.http com a request para criar e listar as orders.

## Rodando o projeto

Executar no Makefile para instalar os pre-requisitos para funcionar como esperado:


1.
```makefile
make pre-req
```
---

2.

```makefile
make desafio
```

*OBS: Durante a execução do makefile é possível que apresente problemas de contexto, então executar 1 comando por vez pode resolver.*

---

## Testando o projeto
- #### HTTP
  Ao rodar as requests contidas na pasta `api` com o nome `api.http` é possível testar ou executando o Makefile

3.
```makefile
make requests
```

---

- #### GRPC
  Rodar o comando:
  ```bashup -d
  evans -r repl
  package pb
  service OrderService
  call [Method Name] # Selecionar o método (CreateOrder ou ListOrders).
  ```
- #### GraphQL
  Acessar o endereço `http://localhost:8080/graphql` e rodar a query:
  - Create Order:
    ```graphql
      mutation createOrder  {
        createOrder(
          input: {
            id: "xpto2",
            Price: 10.30,
            Tax: 50.10
          }
        )
        {
          id,
          Price, 
          Tax,
          FinalPrice
        }
      }
      ```
  - List Orders:
    ```graphql
      query listOrders {
        orders {
          id
          Tax
          Price
          FinalPrice
       }
     }
    ```