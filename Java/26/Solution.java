class Solution {
    public int removeDuplicates(int[] nums) {

       int quantidadeUnicos = 1;

       for(int atual = 1; atual < nums.length; atual++) {
        if(nums[atual] != nums[atual-1]) {
            nums[quantidadeUnicos] = nums[atual];
            quantidadeUnicos++;
        }

       }
       return quantidadeUnicos;
    }
}