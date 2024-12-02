;Hafsa Amjad 
;23-NTU-CS-1162
include irvine32.inc
.data
Array SWORD 2, 4, -1, 6, -3, 8, -5
msg db "Total sum of odd values:", 0
msg1 db "Count of odd values:", 0

.code
main proc
mov eax, 0 
    mov ebx, 0 
    mov esi, OFFSET Array   ;mov the address of the array in esi 
    mov ecx, LengthOf Array  ;give the length of array to the loop counter 

Next:
    movsx edx, WORD PTR [esi]   ;load the current element into the edx
    test edx, 1                 ;check the number is even or odd by checking the LSB
    jz pass                     ;pass if the value is not zero 
    add eax, edx                ;add the even number to eax
    inc ebx                     ;increment in the count
pass:
    add esi, TYPE Array         ;moving to the next index
    loop Next                   ;calling of loop 

    mov edx, OFFSET msg 
    call writestring
    movsx eax, ax 
    call writeint 
    call crlf

    mov edx, OFFSET msg1 
    call writestring
    mov eax, ebx 
    call writedec 
    call crlf
exit
main endp
end main