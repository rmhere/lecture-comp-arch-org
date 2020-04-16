.data
prompt1:    .asciiz    "Podaj znak: "            # tekst do wyswietlenia przy pobraniu znaku
prompt2:    .asciiz    "Znak po inkrementacji: " # tekst do wyswietlenia po inkrementacji
var1:       .space     4                         # przestrzen w pamieci #1
var2:       .space     4                         # przestrzen w pamieci #2

.text
.global __start
__start:
    # wyswietlenie tekstu
    li    $a0, 1
    la    $a1, prompt1
    li    $a2, 12
    li    $v0, 4004
    syscall

    # pobranie znaku od uzytkownika i umieszczenie pod adresem var1
    li    $a0, 0
    la    $a1, var1
    li    $a2, 1
    li    $v0, 4003
    syscall

    # skopiowanie zawartosci z var1 do t0
    lw $t0, var1

    # inkrementacja zawartosci t0 o jeden
    addi $t0, $t0, 1

    # skopiowanie zawartosci t0 do var2
    sw $t0, var2

    # wyswietlenie tekstu
    li    $a0, 1
    la    $a1, prompt2
    li    $a2, 23
    li    $v0, 4004
    syscall

    # wyswietlenie zawartosci znajdujacej sie pod adresem var2
    li    $a0, 1
    la    $a1, var2
    li    $a2, 1
    li    $v0, 4004
    syscall

    # wyjscie z programu
    li    $a0, 3
    li    $v0, 4001
    syscall
