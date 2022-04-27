	.file	"To_Upper.s"
	.text
	.globl	To_Upper
	.type	To_Upper, @function

/* **********************
    Name:
    Wisc ID Number:
    Wisc Email:
************************ */


To_Upper:

# C version
/* **********************
    Write the equivalent C code to this function here (in the comment block)

void To_Upper(char *str) {
    char *p;
    for (p = str; *p != 0; p++)
        if (*p >= 97 && *p <= 122)
            *p -= 32;
}

************************ */


# Memory Layout
/* ************************ 
    Make a table showing the stack frame for your function (in the comment block)
    The first column should have a memory address (e.g. 8(%rsp))
    The second column should be the name of the C variable used above
    Update the example below with your variables and memory addresses
        %rax    |   str
        %rdx    |   i
        %cl     |   c
************************ */


# Prologue


# This code prints the letter 'a' (ascii value 97)
# Use this for debugging
# Comment out when finished - your function should not print anything
# Note putchar overwrites all caller saved registers including argument registers
#	movl	$97, %eax
#	movl	%eax, %edi
#	call	putchar@PLT


# Body of function
begin:
    movq    %rdi, %rax
    movzbl  (%rdi), %ecx
    testb   %cl, %cl
    je      end_reached

end_not_reached:
    leal    -97(%rax), %edx
    cmpb    $25, %dl
    ja      not_lower
    subl    $32, %ecx
    addq    $1, %rax
    movb    %cl, -1(%rax)
    movzbl  (%rax), %ecx
    testb   %cl, %cl
    jne     end_not_reached

not_lower:
    movzbl  1(%rax), %ecx
    addq    $1, %rax
    testb   %cl, %cl
    jne     end_not_reached

end_reached:
    # recover, add later
# Epilogue
    ret
