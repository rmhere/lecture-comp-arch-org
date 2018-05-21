# The following code is a reduced version of
# the program authored by Karl Marklund
#
# See the following module for full version:
# https://github.com/uu-os-2018/module-1.git

.text

main:
 li $s0, 0x7fffffff  
 addi $s1, $s0, 1

.kdata
		
overflow: .asciiz "Overflow (arithmetic)\n\n" 

.ktext 0x80000180  
   
__kernel_entry_point:

# Get value in cause register and copy it to $k0.
	
mfc0 $k0, $13   
	
# Mask all but the exception code (bits 2 - 6) to zero.
	
andi $k1, $k0, 0x00007c  
	
# Shift two bits to the right to get the exception code in a comparable form
	
srl  $k1, $k1, 2
	
# Now $k0 = value of cause register
#     $k1 = exception code 

__exception:

# Branch on value of the the exception code in $k1.
# (overflow exception has the code 12)
	
 beq $k1, 12, overflow_exception

 j __resume_from_exception

__overflow_exception:

#  Use the MARS built-in system call 4 (print string) to print error messsage.
	
 li $v0, 4
 la $a0, overflow
 syscall
 
j __resume_from_exception
 	
__resume_from_exception: 
	
# When an exception or interrupt occurs, the value of the program counter 
# ($pc) of the user level program is automatically stored in the exception 
# program counter (ECP), the $14 in Coprocessor 0. 

# Get value of EPC (Address of instruction causing the exception).
       
mfc0 $k0, $14 # not needed for eret
    
# Use the eret (Exception RETurn) instruction to set the program counter
# (PC) to the value saved in the ECP register (register 14 in coporcessor 0).
	
eret # Look at the value of $14 in Coprocessor 0 before single stepping.
