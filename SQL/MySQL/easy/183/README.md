# 183. Customers Who Never Order

## 📌 Descrição
Escreva uma solução para encontrar **todos os clientes que nunca fizeram um pedido**.

---

## 📂 Estrutura da Tabela

### **Tabela: Customers**
| Column Name | Type    | Description |
|-------------|---------|-------------|
| id          | int     | Chave primária (PK), identifica um cliente de forma única. |
| name        | varchar | Nome do cliente. |

### **Tabela: Orders**
| Column Name | Type | Description |
|-------------|------|-------------|
| id          | int  | Chave primária (PK), identifica um pedido de forma única. |
| customerId  | int  | Chave estrangeira (FK), refere-se ao `id` da tabela `Customers`. |

---

## 📝 **Exemplo de Entrada e Saída**

### **Entrada**

**Tabela `Customers`**:
| id | name  |
|----|-------|
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |

**Tabela `Orders`**:
| id | customerId |
|----|------------|
| 1  | 3          |
| 2  | 1          |

### **Saída Esperada**
| Customers |
|-----------|
| Henry     |
| Max       |

🔹 **Explicação**:
- `Henry` e `Max` não aparecem na tabela `Orders`, o que significa que **nunca fizeram um pedido**.
- `Joe` e `Sam` possuem `customerId` na tabela `Orders`, então **não aparecem na saída**.

---

## 💡 **Solução SQL**
```sql
SELECT
    c.name as Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;
```

---

## 🚀 **Explicação da Solução**
1. **`SELECT c.name AS Customers FROM Customers c`** → Selecionamos os nomes dos clientes.
2. **`LEFT JOIN Orders o ON c.id = o.customerId`** → Fazemos um `LEFT JOIN` para buscar tudo, até mesmo o que tiverem `NULL`
3. **`WHERE o.customerId IS NULL`** → Filtramos apenas os que não tiverem o customerId presente