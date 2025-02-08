# 182. Duplicate Emails

## 📌 Descrição
Escreva uma solução para identificar **todos os e-mails duplicados** na tabela `Person`.

---

## 📂 Estrutura da Tabela

### **Tabela: Person**
| Column Name | Type    | Description |
|-------------|---------|-------------|
| id          | int     | Chave primária (PK), identifica um e-mail de forma única. |
| email       | varchar | E-mail de um usuário (todos em letras minúsculas). |

🔹 **O campo `email` nunca será NULL.**

---

## 📝 **Exemplo de Entrada e Saída**

### **Entrada**

**Tabela `Person`**:
| id | email   |
|----|---------|
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |

### **Saída Esperada**
| Email   |
|---------|
| a@b.com |

🔹 **Explicação**:
- O e-mail **`a@b.com`** aparece **duas vezes** na tabela.
- Precisamos retornar apenas os **e-mails que se repetem pelo menos uma vez**.

---

## 💡 **Solução SQL**
```sql
SELECT
    p.email as Email
FROM Person p
GROUP BY Email
HAVING COUNT(p.email) > 1
```

---

## 🚀 **Explicação da Solução**
1. **`GROUP BY Email`** → Agrupa os registros por endereço de e-mail.
2. **`HAVING COUNT(Email) > 1`** → Filtra apenas os e-mails que aparecem **mais de uma vez**.