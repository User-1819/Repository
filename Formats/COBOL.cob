IDENTIFICATION DIVISION.
PROGRAM-ID. FILE-CLONER.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-IN ASSIGN TO "File.txt"
        ORGANIZATION IS LINE SEQUENTIAL.
    SELECT FILE-OUT ASSIGN TO DYNAMIC FILE-NAME
        ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD FILE-IN.
01 FILE-RECORD PIC X(1000).

FD FILE-OUT.
01 FILE-OUT-RECORD PIC X(1000).

WORKING-STORAGE SECTION.
01 WS-NUMBER USAGE BINARY-LONG UNSIGNED.
01 WS-NUMBER2 USAGE BINARY-LONG UNSIGNED.
01 WS-NUMBER3 USAGE BINARY-LONG UNSIGNED VALUE 18446744073709551615.
01 WS-FILE-NAME PIC X(100).
01 WS-FILE-CONTENTS PIC X(1000).
01 WS-EOF PIC X VALUE 'N'.
01 WS-COUNTER PIC 9(20).
01 WS-COUNTER-DISPLAY PIC Z(19)9.
01 FILE-NAME PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-PROGRAM
    PERFORM PROCESS-FILES
    STOP RUN.

INITIALIZE-PROGRAM.
    MOVE "File.txt" TO WS-FILE-NAME
    OPEN INPUT FILE-IN
    IF FILE-STATUS NOT = "00"
        OPEN OUTPUT FILE-IN
        MOVE "Goodbye Cruel World!" TO FILE-RECORD
        WRITE FILE-RECORD
        CLOSE FILE-IN
    END-IF
    DISPLAY "WARNING! THIS A FILE CLONER! "
    DISPLAY "EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!"
    ACCEPT OMITTED
    CALL "CBL_CLEAR_SCREEN".

PROCESS-FILES.
    MOVE "File.txt" TO WS-FILE-NAME
    OPEN INPUT FILE-IN
    READ FILE-IN INTO WS-FILE-CONTENTS
    CLOSE FILE-IN
    MOVE 0 TO WS-NUMBER
    MOVE 0 TO WS-NUMBER2
    PERFORM UNTIL WS-NUMBER >= WS-NUMBER3
        ADD 1 TO WS-NUMBER2
        MOVE WS-NUMBER2 TO WS-COUNTER
        MOVE WS-COUNTER TO WS-COUNTER-DISPLAY
        DISPLAY WS-COUNTER-DISPLAY WITH NO ADVANCING
        STRING "File (" DELIMITED BY SIZE
               WS-NUMBER2 DELIMITED BY SIZE
               ").txt" DELIMITED BY SIZE
               INTO FILE-NAME
        OPEN EXTEND FILE-OUT
        MOVE WS-FILE-CONTENTS TO FILE-OUT-RECORD
        WRITE FILE-OUT-RECORD
        CLOSE FILE-OUT
        MOVE FUNCTION CURRENT-DATE TO WS-FILE-NAME
    END-PERFORM
    DISPLAY SPACE.
