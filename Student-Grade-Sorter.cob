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
       DATA DIVISION.
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
