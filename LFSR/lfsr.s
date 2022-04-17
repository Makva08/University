.globl _lfsr
_lfsr:

pushl %ebp
movl %esp,%ebp

movl 8(%ebp), %ecx                  # ecx = x;
movl 12(%ebp), %edx                 # edx = key-bit

movl %ecx, %eax
movl %ecx, %ecx
movl %ecx, %esi
movl %ecx, %edi

movl %ecx, %ebx                     # ebx = x;
shrl $0,%ecx                        # ecx = x >> 0

movl %ebx, %eax                     # eax = x;
shrl $2,%ebx                        # ebx = x >> 2

movl %eax, %esi                     # esi = x;
shrl $6,%eax                        # eax = x >> 6

movl %esi, %edi                     # edi = x;
shrl $7,%esi                        # esi = x >> 7

xorl %ebx,%ecx
xorl %eax,%ecx
xorl %esi,%ecx          #ecx = ((temporary >> 0) ^ (temporary >> 2) ^ (temporary >> 6) ^ (temporary >> 7) );

sall $31, %ecx                  # ecx = ecx << 31
shrl $1, %edi                   # edi = edi >> 1
orl %ecx,%edi                   # %edi = edi or ecx
movl %edi, %eax

movl %ebp, %esp
popl %ebp
ret
