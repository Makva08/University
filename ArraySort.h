#include <stdio.h>

void SortArray(int list[], int size){
   for(int i=0;i<size;i++){
      for(int j=i;j<size;j++){
         if(list[j] < list[i]){
            list[j] += list[i];
            list[i] = list[j]-list[i];
            list[j] -= list[i];
         }
      }
   }
}

int main(void) {

   /* Type your code here. */
   int array[20],size;
   
   scanf("%d",&size);
   for(int i=0;i<size;i++)
      scanf("%d",array+i);
   
   SortArray(array,size);
   for(int i=0;i<size;i++)
      printf("%d ",array[i]);
   printf("\n");

   return 0;
}
