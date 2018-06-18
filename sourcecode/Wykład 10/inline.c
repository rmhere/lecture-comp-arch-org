# Example authored by Krzysztof Wojciechowski

#include <stdio.h>
int add() {
    int output;
    /* Add 10 and 20 and store result into special name %0 (will be stored as `output`).
     * Uses register %ebx as cache. */
    __asm__ ("movl $10, %0\n\t"
             "movl $20, %%ebx\n\t"
             "addl %%ebx, %0"
    : "=r" (output) : : "ebx");
    return output;
}

int sub() {
    /* Subtract 20 from 10 and store result into register %eax.
     * %eax stores the return value on x86. This code may work, but is not
     * standards-compliant, and compilers may make it return 0 or the wrong
     * value. */
    __asm__ ("movl $10, %eax\n\t"
             "movl $20, %ebx\n\t"
             "subl %ebx, %eax"
    );
}

int mul(int N) {
    /* Multiply N (stored in memory) by 10 and return result */
    int output;
    __asm__ ("movl $10, %0\n\t"
             "imull %1, %0"
    : "=r" (output) : "m" (N));
    return output;
}

int main() {
    int add_result, sub_result, mul_result;
    add_result = add();
    sub_result = sub();
    mul_result = mul(50);
    printf("%d, %d, %d\n", add_result, sub_result, mul_result);
    return 0;
}
