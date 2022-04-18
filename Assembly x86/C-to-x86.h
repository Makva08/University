C function:

int somefunction(int a, int b) 
{ 
int c; 
c = 0; 
if (a > b ) c = 1; 
return(c); 
} 

Equivalent assembly language function:

.global _SomeFunction 
_SomeFunction:
	pushl %ebp
	movl %esp,%ebp

	movl 8(%ebp),%ebx    
      movl 12(%ebp),%edx 
      xorl %eax, %eax    
      cmpl %edx,%ebx    
      jle End
      movl $1, %eax

 End: movl %ebp, %esp
      popl %ebp
      ret


%%%%%%%%%%%%%%%%%%%%%%%%%


C function:

int countOnes(int number) 
{ 
     int a ; 
     int count = 0; 
     int i; 
     a = 1; 
     for (i = 0; i < 31; i++) 
     { 
          if (a & number) != 0) count++; 
          a << 1; 
     } 
     return(count); 
} 

Equivalent assembly language function:

.global _countOnes
_countOnes:
	pushl %ebp
	movl %esp,%ebp

	movl 8(%ebp),%ebx    
      xorl %eax, %eax    
      movl $1, %ecx     
      xorl %esi, %esi    
      cmpl $32,%esi    
      jge End
For_loop:
      movl %ebx, %edx   
      andl %ecx, %edx   
      cmpl $0, %edx
      je L1
      incl %eax
  L1: shll $1, %ecx 
      
      incl %esi      
      cmpl $32,%esi   
      jge End
      jmp For_loop

End: movl %ebp, %esp
      popl %ebp
      ret

