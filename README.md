# Exercicioconstraint3
Criar, em SQL Server, considerando o domínio de uma mecânica, conforme modelado:

![image](https://github.com/ByancaMatos01/Exercicioconstraint3/assets/122841376/4845a231-921c-485d-8da8-24cd40feaa8a)

Foram delimitadas as seguintes restrições:
- O ID do cliente é auto incremental partindo de 3401 e incrementando de 15 em 15
- O ID do funcionário é auto incremental partindo de 101 e incrementando de 1 em 1
- O ID da peça é auto incremental partindo de 3411 e incrementando de 7 em 7
- O ID da categoria é auto incremental partindo de 1 e incrementando de 1 em 1
- Nenhum número de endereço é negativo
- Todos os CEP de endereços devem ter 8 dígitos
- Se não preenchida, a data do reparo deve ser a data de hoje
- A oficina só trabalha com carros de modelo superior a 1997
- A oficina só trabalha com carros de fabricação superior a 1997
- O ano do modelo deve ser igual ou 1 ano superior ao ano de fabricação
- Não existem preços, custos, tempo ou valores negativos
- Telefones podem ser fixos ou celulares, tendo 10 ou 11 dígitos
- Categorias de Habilitação devem ser A, B, C, D ou E
- Todas as peças devem ter, ao menos, 10 unidades em estoque
- No Brasil, toda placa de veículo tem 7 caracteres
- Cada peça tem nome diferente
  
- As categorias de funcionários são estagiário, Nível 1, Nível 2 ou Nível 3 e seguem os valores:
- Estagiário: Mais de R$15,00 / hora
- Nível 1: Mais de R$25,00 / hora
- Nível 2: Mais de R$35,00 / hora
- Nível 3: Mais de R$50,00 / hor
