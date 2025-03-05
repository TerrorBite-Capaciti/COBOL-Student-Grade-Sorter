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
           SELECT PERSON-FILE ASSIGN TO 'students.csv'.

      *****Below file is for processing a file with columns etc.
           SELECT STUDENTS-FILE ASSIGN TO 'students_records.txt'.

           SELECT SORTED-FILE ASSIGN TO 'sorted_student_records.txt'.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENTS-FILE.
       01 STUDENT-RECORD.
           05 STUDENT-ID PIC 9(5).
           05 FIRST-NAME PIC A(10).
           05 LAST-NAME PIC A(10).
           05 GRADE PIC 9(3).
           05 AGE PIC 9(2).
           05 COURSE PIC A(15).

       WORKING-STORAGE SECTION.
       01 USER-CHOICE PIC 9 VALUE 0.

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
               DISPLAY "Sorting by Name...".
