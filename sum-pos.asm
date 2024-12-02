;Hafsa Amjad 
;23-NTU-CS-1162
include irvine32.inc
.data
Array SWORD 5, 10, -15, 7, -6, -4, -3     ;declaration of array 
msg db "Total sum of positive values:", 0   
msg1 db "Count of positive values:", 0
.code
main proc
mov eax, 0    ;initialize the eax and ebx with 0 to avoid the garbage value
mov ebx, 0
mov esi, OFFSET Array     ;mov the address of the array to the esi 
mov ecx, LengthOf Array   ;give the length of array to loop counter ecx
Next:
cmp WORD PTR [esi], 0     ;check if the value is positive or negative 
jle pass                  ;pass if the value is less than and equal to zero 
add ax, WORD PTR [esi]    ;addition of positive value 
inc ebx                   ;increment in the count of positive numbers 
pass:
add esi, TYPE Array       ;moving to the next index 
loop Next                  ;calling of loop 
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