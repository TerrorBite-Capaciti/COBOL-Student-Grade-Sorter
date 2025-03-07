      ******************************************************************
      * Author: TerrorBite CAPACITI
      * Date: 04 March 2025
      * Purpose: Sort student grades into ascending order
      * Compiler: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUDENT-GRADE-SORTER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENTS-FILE ASSIGN TO 'students_records.txt'.
           SELECT SORTED-FILE ASSIGN TO "sorted_student_records.txt".
           SELECT SORT-WORK ASSIGN TO "SORT-WORK".

      *****Below file is for processing a file with columns etc.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENTS-FILE.
       01 STUDENT-RECORD.
           05 STUDENT-ID PIC X(5).
           05 FIRST-NAME PIC A(10).
           05 LAST-NAME PIC A(10).
           05 GRADE PIC X(3).
           05 AGE PIC X(2).
           05 COURSE PIC A(15).

       FD SORTED-FILE.
       01 SORTED-STUDENT-RECORD.
           05 SORTED-STUDENT-ID PIC X(5).
           05 SORTED-FIRST-NAME PIC A(10).
           05 SORTED-LAST-NAME PIC A(10).
           05 SORTED-GRADE PIC X(3).
           05 SORTED-AGE PIC X(2).
           05 SORTED-COURSE PIC A(15).

       SD SORT-WORK
       DATA RECORD IS SORT-STUDENT-RECORD.
       01 SORT-STUDENT-RECORD.
           05 SW-STUDENT-ID PIC X(5).
           05 SW-FIRST-NAME PIC A(10).
           05 SW-LAST-NAME PIC A(10).
           05 SW-GRADE PIC X(3).
           05 SW-AGE PIC X(2).
           05 SW-COURSE PIC A(15).


       WORKING-STORAGE SECTION.
       01 USER-CHOICE PIC 9 VALUE 0.
       01 WS-EOF PIC X VALUE "N".

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM DISPLAY-MENU
           PERFORM GET-CHOICE
           PERFORM PROCESS-CHOICE
           STOP RUN.

       DISPLAY-MENU.
           DISPLAY "1. Sort By Grade".
           DISPLAY "2. Sort By Name".

       GET-CHOICE.
           DISPLAY "Enter choice: " WITH NO ADVANCING.
           ACCEPT USER-CHOICE.

           IF USER-CHOICE NOT = 1 AND USER-CHOICE NOT = 2 THEN
               DISPLAY "Invalid choice. Please enter 1 or 2."
               PERFORM GET-CHOICE.

       PROCESS-CHOICE.
           IF USER-CHOICE = 1 THEN
               DISPLAY "Sorting by Grade..."
               PERFORM SORT-BY-GRADE
           ELSE
               DISPLAY "Sorting by Name..."
               PERFORM SORT-BY-NAME
           END-IF.

       SORT-BY-GRADE.
                SORT SORT-WORK ON ASCENDING KEY SW-GRADE
                   INPUT PROCEDURE READ-STUDENTS
                   OUTPUT PROCEDURE WRITE-STUDENTS.


       SORT-BY-NAME.
                 SORT SORT-WORK ON ASCENDING KEY SW-LAST-NAME
                   INPUT PROCEDURE READ-STUDENTS
                   OUTPUT PROCEDURE WRITE-STUDENTS.

       READ-STUDENTS.
              OPEN INPUT STUDENTS-FILE.
              MOVE "N" TO WS-EOF.
              PERFORM UNTIL WS-EOF = "Y"
               READ STUDENTS-FILE
                   AT END MOVE "Y" TO WS-EOF
                   NOT AT END
                       MOVE STUDENT-ID TO SW-STUDENT-ID
                       MOVE FIRST-NAME TO SW-FIRST-NAME
                       MOVE LAST-NAME TO SW-LAST-NAME
                       MOVE GRADE TO SW-GRADE
                       MOVE AGE TO SW-AGE
                       MOVE COURSE TO SW-COURSE
                       RELEASE SORT-STUDENT-RECORD
      * **** THIS SENDS DATA TO SORT
      *>                  WRITE SORT-STUDENT-RECORD

           END-PERFORM.
           CLOSE STUDENTS-FILE.

       WRITE-STUDENTS.
                OPEN OUTPUT SORTED-FILE.
                MOVE "N" TO WS-EOF.
                PERFORM UNTIL WS-EOF ="Y"
                RETURN SORT-WORK INTO SORT-STUDENT-RECORD
                 AT END MOVE "Y" TO WS-EOF
                  NOT AT END
                  MOVE SW-STUDENT-ID TO SORTED-STUDENT-ID
                  MOVE SW-FIRST-NAME TO SORTED-FIRST-NAME
                  MOVE SW-LAST-NAME TO SORTED-LAST-NAME
                  MOVE SW-GRADE TO SORTED-GRADE
                  MOVE SW-AGE TO SORTED-AGE
                  MOVE SW-COURSE TO SORTED-COURSE
                   WRITE SORTED-STUDENT-RECORD FROM SORT-STUDENT-RECORD
           END-PERFORM.
           CLOSE SORTED-FILE.
           DISPLAY "Sorting completed successfully.".
