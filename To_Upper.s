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
    for (char *p = str; *p; p++)
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
begin:                          # function begin
    movq    %rdi, %rax          # move parameter str to %rax
    movzbl  (%rdi), %ecx        # move first char to %cl
    testb   %cl, %cl            # test if first char is '\0'
    je      end_reached         # if so, end reached

end_not_reached:                # else it goes here
    leal    -97(%rcx), %edx     # let %dl = %cl - 'a' = %cl - 97. %dl is a copy of %cl used to detect its case
    cmpb    $25, %dl            # (a trick) for unsigned int, if %dl < 'a', then %dl - 'a' will be a large number
                                # and %dl > 'z' is equivalent to %dl - 'a' > 25
    ja      not_lower           # so if either of them is true, i.e. %dl is not lower char, then unsigned %dl - 97
                                # should be greater than 25
    subl    $32, %ecx           # if not jumped, %cl is lower char. To upper it, subtract it with 32
    addq    $1, %rax            # make str pointer increase by 1 to point to the next char
    movb    %cl, -1(%rax)       # move previous uppered char back to memory
    movzbl  (%rax), %ecx        # move next char to %cl
    testb   %cl, %cl            # and test if it's '\0'
    jne     end_not_reached     # if not '\0', then end is not reached, repeat

not_lower:                      # not lower char goes here
    movzbl  1(%rax), %ecx       # move next char to %cl
    addq    $1, %rax            # and increase the str pointer by 1
    testb   %cl, %cl            # test if the next char is '\0'
    jne     end_not_reached     # if not '\0', then end is not reached, repeat

end_reached:                    # end reached, will return
    # recover, add later
# Epilogue
    ret
