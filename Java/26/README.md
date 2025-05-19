# 26. Remove Duplicates from Sorted Array

## 📌 Descrição

Dado um array de inteiros `nums` **ordenado em ordem crescente**, remova os elementos duplicados **in-place**, de forma que **cada elemento único apareça apenas uma vez**.

Você **deve modificar o array `nums` diretamente**, e retornar a quantidade de elementos únicos (`k`). Os primeiros `k` elementos de `nums` devem conter os valores únicos, mantendo a **ordem original**. Os elementos após `k` não importam.

---

## 📂 Exemplo de Entrada e Saída

### **Entrada e Saída Esperada**

| Entrada                 | Saída (`k`) | `nums` modificado       |
| ----------------------- | ----------- | ----------------------- |
| `[1,1,2]`               | `2`         | `[1,2,_]`               |
| `[0,0,1,1,1,2,2,3,3,4]` | `5`         | `[0,1,2,3,4,_,_,_,_,_]` |

> `_` indica que o valor após `k` não é relevante.

---

## 🛠 **Restrições**

* `1 <= nums.length <= 30_000`
* `-100 <= nums[i] <= 100`
* `nums` está ordenado em **ordem não decrescente**

---

## 💡 **Solução em Java**

```java
class Solution {
    public int removeDuplicates(int[] nums) {
        int quantidadeUnicos = 1;

        for (int atual = 1; atual < nums.length; atual++) {
            if (nums[atual] != nums[atual - 1]) {
                nums[quantidadeUnicos] = nums[atual];
                quantidadeUnicos++;
            }
        }

        return quantidadeUnicos;
    }
}
```

---

## 🚀 **Explicação da Solução**

1. O primeiro elemento de `nums` é sempre único, então começamos com `quantidadeUnicos = 1`.
2. Usamos um loop com `atual` a partir de 1 até o fim do array.
3. A cada passo:

   * Comparamos `nums[atual]` com `nums[atual - 1]`
   * Se forem diferentes, é um novo valor único → salvamos ele na posição `quantidadeUnicos` e incrementamos `quantidadeUnicos`.
4. No fim, os `quantidadeUnicos` primeiros elementos de `nums` contêm os valores únicos em ordem.

---

## ⏱ **Complexidade**

* **Tempo:** `O(n)` → percorre o array uma única vez
* **Espaço:** `O(1)` → feito in-place, sem alocação de novo array