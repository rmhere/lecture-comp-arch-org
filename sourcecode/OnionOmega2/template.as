# sekcja danych
.data

# sekcja instrukcji
.text
.global __start
__start:

# konczymy program
    li $a0, 3
    li $v0, 4001
    syscall
