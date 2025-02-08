# 181. Employees Earning More Than Their Managers

## 📌 Descrição
Escreva uma solução para encontrar os funcionários que ganham **mais** do que seus respectivos gerentes.

---

## 📂 Estrutura da Tabela

### **Tabela: Employee**
| Column Name | Type    | Description |
|-------------|---------|-------------|
| id          | int     | Chave primária (PK), identifica um funcionário de forma única. |
| name        | varchar | Nome do funcionário. |
| salary      | int     | Salário do funcionário. |
| managerId   | int     | ID do gerente deste funcionário (pode ser NULL para CEOs). |

---

## 📝 **Exemplo de Entrada e Saída**

### **Entrada**

**Tabela `Employee`**:
| id | name  | salary | managerId |
|----|-------|--------|-----------|
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |

### **Saída Esperada**
| Employee |
|----------|
| Joe      |

🔹 **Explicação**:
- `Joe` (salário: 70.000) tem o gerente `Sam` (salário: 60.000) e **ganha mais** do que ele.
- `Henry` tem o gerente `Max`, mas **não ganha mais que ele**.
- `Sam` e `Max` são gerentes e não possuem superiores.

---

## 💡 **Solução SQL**
```sql
SELECT
    employee.name as Employee
FROM Employee employee
INNER JOIN Employee manager ON manager.id = employee.managerId
WHERE employee.salary > manager.salary;
```

---

## 🚀 **Explicação da Solução**
1. **`INNER JOIN`** → Junta a tabela `Employee` consigo mesma para comparar funcionários e seus gerentes.
2. **`ON manager.id = employee.managerId`** → Relaciona cada funcionário ao seu gerente correspondente.
3. **`employee.salary > manager.salary`** → Filtra apenas os funcionários cujo salário é **maior** que o de seus gerentes.