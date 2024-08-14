asm
.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\msvcrt.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\msvcrt.lib

.data
    Number QWORD 0
    Number2 QWORD 0
    Number3 QWORD 0FFFFFFFFFFFFFFFFh
    file db "File.txt", 0
    warning db "WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!", 0
    format db "%s", 0
    formatNum db "%llu", 0
    newline db 13, 10, 0
    contents db 256 dup(0)
    File2 db "File (", 256 dup(0)
    closeParenTxt db ").txt", 0

.code
start:
    ; Check if file exists
    invoke CreateFile, addr file, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
    cmp eax, INVALID_HANDLE_VALUE
    jne file_exists

    ; File doesn't exist, create it
    invoke CreateFile, addr file, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
    mov ebx, eax
    invoke WriteFile, ebx, addr warning, sizeof warning - 1, NULL, NULL
    invoke CloseHandle, ebx

file_exists:
    ; Print warning
    invoke crt_printf, addr format, addr warning
    invoke crt_printf, addr newline

    ; Wait for key press
    invoke _getch

    ; Call End function
    call End

    ; Exit program
    invoke ExitProcess, 0

End proc
    ; Clear console
    invoke system, addr format

    ; Read file contents
    invoke CreateFile, addr file, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
    mov ebx, eax
    invoke ReadFile, ebx, addr contents, sizeof contents, NULL, NULL
    invoke CloseHandle, ebx

    ; Loop
    mov Number, 0
    mov Number2, 0

loop_start:
    ; Append contents to file
    invoke CreateFile, addr file, FILE_APPEND_DATA, 0, NULL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
    mov ebx, eax
    invoke WriteFile, ebx, addr contents, sizeof contents, NULL, NULL
    invoke CloseHandle, ebx

    ; Print progress
    invoke crt_printf, addr formatNum, Number2
    inc Number2

    ; Set console title
    invoke wsprintf, addr File2, addr formatNum, Number2
    invoke SetConsoleTitle, addr File2

    ; Copy file
    invoke wsprintf, addr File2, addr format, addr file
    invoke lstrcat, addr File2, addr closeParenTxt
    invoke CopyFile, addr file, addr File2, FALSE

    ; Update file name
    invoke lstrcpy, addr file, addr File2

    ; Check loop condition
    mov eax, Number
    cmp eax, Number3
    jl loop_start

    ; Print newline
    invoke crt_printf, addr newline

    ret
End endp

end start


