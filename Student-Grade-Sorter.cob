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
           SELECT STUDENTS-FILE ASSIGN TO 'students_records.txt'.

           SELECT SORTED-FILE ASSIGN TO 'sorted_student_records.txt'.

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

       SD SORTED-FILE.
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
           ELSE
               DISPLAY "Sorting by Name....".
