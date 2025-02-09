# 709. To Lower Case

## 📌 Descrição
Dado uma string `s`, retorne a string após substituir **todas as letras maiúsculas** por **letras minúsculas**.

---

## 📂 Exemplo de Entrada e Saída

### **Entrada e Saída Esperada**

| Entrada | Saída |
|---------|-------|
| "Hello" | "hello" |
| "here" | "here" |
| "LOVELY" | "lovely" |

---

## 🛠 **Restrições**
- `1 <= s.length <= 100`
- `s` consiste em **caracteres ASCII imprimíveis**.

---

## 💡 **Solução em Java**
```java
class Solution {
    public String toLowerCase(String s) {
        return s.toLowerCase();
    }
}
```

---

## 🚀 **Explicação da Solução**

1. **`s.toLowerCase()`** → Converte todos os caracteres maiúsculos para minúsculos.

