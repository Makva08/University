#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern unsigned long lfsr(unsigned long *start_seed);

int main()
{
unsigned long temporary = 0x5AA5FF00u;
unsigned long start_seed = 0x5AA5FF00u;
unsigned long x = 0x5AA5FF00u;
unsigned long y;
unsigned long key_bit;
int k= 0;
int i = 0;
printf("Values in C are: \n");

while(k<20)
{

key_bit = ((temporary >> 0) ^ (temporary >> 2) ^ (temporary >> 6) ^ (temporary >> 7) );

temporary = (key_bit << 31) | (temporary >> 1);
++k;

printf("%u\n", temporary);
if (temporary == start_seed){
    break;
}
}


printf("\nValues in assembly are :\n");

for (i=0;i<20;++i){
    y = lfsr(x);
    x=y;
    printf("%u\n", y);

}


return 0;
}

