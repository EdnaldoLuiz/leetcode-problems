# 175. Combine Two Tables

## 📌 Descrição
Escreva uma solução para exibir o **primeiro nome, sobrenome, cidade e estado** de cada pessoa na tabela `Person`. Caso um `personId` não tenha um endereço na tabela `Address`, exiba `NULL` para os campos `city` e `state`.

---

## 📂 Estrutura das Tabelas

### **Tabela: Person**
| Column Name | Type    | Description |
|-------------|---------|-------------|
| personId    | int     | Chave primária (PK), identifica uma pessoa de forma única. |
| lastName    | varchar | Sobrenome da pessoa. |
| firstName   | varchar | Primeiro nome da pessoa. |

### **Tabela: Address**
| Column Name | Type    | Description |
|-------------|---------|-------------|
| addressId   | int     | Chave primária (PK), identifica um endereço de forma única. |
| personId    | int     | Chave estrangeira (FK), refere-se à `personId` na tabela `Person`. |
| city        | varchar | Cidade onde a pessoa reside. |
| state       | varchar | Estado onde a pessoa reside. |

---

## 📝 **Exemplo de Entrada e Saída**

### **Entrada**

**Tabela `Person`**:
| personId | lastName | firstName |
|----------|---------|-----------|
| 1        | Wang    | Allen     |
| 2        | Alice   | Bob       |

**Tabela `Address`**:
| addressId | personId | city          | state      |
|-----------|----------|---------------|------------|
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |

### **Saída Esperada**
| firstName | lastName | city          | state    |
|-----------|---------|---------------|----------|
| Allen     | Wang    | Null          | Null     |
| Bob       | Alice   | New York City | New York |

🔹 **Explicação**:
- `personId = 1` não tem um endereço na tabela `Address`, então `city` e `state` são `NULL`.
- `personId = 2` tem um endereço (`New York City, New York`), então esses valores são exibidos.

---

## 💡 **Solução SQL**
```sql
SELECT 
    p.firstname,
    p.lastName,
    a.city,
    a.state
FROM Person p
NATURAL LEFT JOIN Address a;
```

---

## 🚀 **Explicação da Solução**
1. **`LEFT JOIN`** → Usado para garantir que **todas as pessoas** apareçam no resultado, mesmo que não tenham um endereço.
2. **`NATURAL` foi uma abreviação de `ON p.personId = a.personId`** → Fazendo a ligação entre a tabela `Person` e a tabela `Address`.
3. **Valores `NULL`** → Se uma pessoa não tiver endereço, os campos `city` e `state` aparecerão como `NULL`.

