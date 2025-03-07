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
           SELECT WORK-FILE ASSIGN TO 'work.tmp'.  *> Add work file for sorting

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

       SD WORK-FILE.  *> Define work file for sorting
       01 WORK-RECORD.
           05 WORK-STUDENT-ID PIC 9(5).
           05 WORK-FIRST-NAME PIC A(10).
           05 WORK-LAST-NAME PIC A(10).
           05 WORK-GRADE PIC 9(3).

       FD SORTED-FILE.
       01 SORTED-STUDENT-RECORD.
           05 STUDENT-ID PIC 9(5).
           05 FIRST-NAME PIC A(10).
           05 LAST-NAME PIC A(10).
           05 GRADE PIC 9(3).

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
               *> Add logic for sorting by grade here (your team's responsibility)
           ELSE
               DISPLAY "Sorting by Name..."
               PERFORM SORT-BY-NAME.  *> Call your sorting logic

       SORT-BY-NAME.
           SORT WORK-FILE
               ON ASCENDING KEY WORK-LAST-NAME  *> Sort by last name
               USING STUDENTS-FILE
               GIVING SORTED-FILE.

           DISPLAY "Student records sorted by name and saved to ",
           "sorted_student_records.txt".
