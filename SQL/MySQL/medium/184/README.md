# 184. Department Highest Salary

## 📌 Descrição
Escreva uma solução para encontrar **os funcionários com o maior salário em cada departamento**.

---

## 📂 Estrutura da Tabela

### **Tabela: Employee**
| Column Name  | Type    | Description |
|--------------|---------|-------------|
| id           | int     | Chave primária (PK), identifica um funcionário de forma única. |
| name         | varchar | Nome do funcionário. |
| salary       | int     | Salário do funcionário. |
| departmentId | int     | Chave estrangeira (FK), refere-se ao `id` da tabela `Department`. |

### **Tabela: Department**
| Column Name | Type    | Description |
|-------------|---------|-------------|
| id          | int     | Chave primária (PK), identifica um departamento de forma única. |
| name        | varchar | Nome do departamento. |

🔹 **O nome do departamento (`name`) nunca será NULL.**

---

## 📝 **Exemplo de Entrada e Saída**

### **Entrada**

**Tabela `Employee`**:
| id | name  | salary | departmentId |
|----|-------|--------|--------------|
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |

**Tabela `Department`**:
| id | name  |
|----|-------|
| 1  | IT    |
| 2  | Sales |

### **Saída Esperada**
| Department | Employee | Salary |
|------------|----------|--------|
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |

🔹 **Explicação**:
- `Jim` e `Max` possuem o maior salário do departamento **IT**.
- `Henry` possui o maior salário do departamento **Sales**.
- `Joe` e `Sam` não aparecem porque **não têm o maior salário em seus departamentos**.

---

## 💡 **Solução SQL**
```sql
SELECT
    d.name as Department,
    e.name as Employee,
    e.salary as Salary
FROM Employee e
INNER JOIN Department d ON e.departmentId = d.id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE departmentId = e.departmentId
)
```

---

## 🚀 **Explicação da Solução**
1. **`INNER JOIN`** → Junta a tabela `Employee` com `Department` para obter o nome do departamento.
2. **`WHERE e.salary = (SELECT MAX(salary) FROM Employee WHERE departmentId = e.departmentId)`** → Seleciona apenas os funcionários que têm o **maior salário dentro do seu departamento**.
3. **Se houver mais de um funcionário com o maior salário no mesmo departamento**, ambos aparecerão no resultado.

---

> Obs: Eu tentei fazer com o `GROUP BY` mas vi que não dava certo, e optei por usar apenas o `MAX` para conseguir trazer mais de um