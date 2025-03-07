      *> ******************************************************************
      *> * Author: TerrorBite CAPACITI
      *> * Date: 04 March 2025
      *> * Purpose: Sort student grades into ascending order
      *> * Compiler: cobc
      *> ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUDENT-GRADE-SORTER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PERSON-FILE ASSIGN TO 'students.csv'.

      *> *****Below file is for processing a file with columns etc.
           SELECT INPUT-FILE ASSIGN TO 'students_file.csv'
      *>      SELECT INPUT-FILE ASSIGN TO 'students_records.txt'
                ORGANIZATION IS SEQUENTIAL.

      *> *****Temp file for compiler to perform SORT operation*************
           SELECT WORK-FILE ASSIGN TO 'temp_sort_file.tmp'.

      *> *****Output file for when records have been sorted****************
           SELECT SORTED-OUTPUT-FILE ASSIGN TO
                'sorted_student_records.txt'
                ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE
       DATA RECORD IS STUDENT-RECORD.
       01 STUDENT-RECORD.
           05 STUDENT-ID PIC 9(5).
           05 FIRST-NAME PIC A(10).
           05 LAST-NAME PIC A(10).
           05 GRADE PIC 9(3).
           05 AGE PIC 9(2).
           05 COURSE PIC A(15).

       SD WORK-FILE
           DATA RECORD IS WORKING-SORT-RECORD.
       01 WORKING-SORT-RECORD.
           05 WF-STUDENT-ID PIC 9(5).
           05 WF-FIRST-NAME PIC A(10).
           05 WF-LAST-NAME PIC A(10).
           05 WF-GRADE PIC 9(3).
      *>      05 WF-STUDENT-RECORD PIC X(25).

       FD SORTED-OUTPUT-FILE
           DATA RECORD IS SORTED-STUDENT-RECORD.
       01 SORTED-STUDENT-RECORD.
           05 S-STUDENT-ID PIC 9(5).
      *>      05 FILLER PIC X(5) VALUE SPACES.
           05 S-STUDENT-FIRST-NAME PIC A(10).
      *>      05 FILLER PIC X(5) VALUE SPACES.
           05 S-STUDENT-LAST-NAME PIC A(10).
      *>      05 FILLER PIC X(5) VALUE SPACES.
           05 S-GRADE PIC 9(3).

       WORKING-STORAGE SECTION.
       01 USER-CHOICE PIC 9 VALUE 0.
       01 WS-SORT-REC PIC X(25).

       01 WS-VAR.
           05 INPUT-FILE-SW PIC X(1) VALUE 'N'.
           88 EOF-INPUT-FILE VALUE 'Y'.
           88 NOT-EOF-INPUT-FILE VALUE 'N'.

           05 EOF-FLAG PIC X(1) VALUE 'N'.
              88 EOF-OKAY VALUE 'Y'.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           SORT WORK-FILE
               ON ASCENDING KEY WF-GRADE
               USING INPUT-FILE
               GIVING SORTED-OUTPUT-FILE
      *>          INPUT PROCEDURE IS STUDENT-SORTER-PARA
      *>          OUTPUT PROCEDURE IS SAVE-SORTED-RECORDS.
      *>             GIVING SORTED-OUTPUT-FILE
       STOP RUN.

       STUDENT-SORTER-PARA.
           SET NOT-EOF-INPUT-FILE TO TRUE

           OPEN INPUT INPUT-FILE.
           OPEN OUTPUT SORTED-OUTPUT-FILE.
           READ INPUT-FILE
                AT END SET EOF-INPUT-FILE TO TRUE
           END-READ.

           DISPLAY "READING UNSORTED RECORDS"


      *>          IF STUDENT-ID = 'S0001' THEN
               PERFORM UNTIL EOF-OKAY

      *>          IF STUDENT-ID = 'S0001' OR STUDENT-ID = 'Student' THEN

                MOVE STUDENT-RECORD TO WS-SORT-REC
                RELEASE WORKING-SORT-RECORD
                DISPLAY "RELEASING TO SORTED-RECORD"
      *>          END-IF

                IF SORT-RETURN NOT = 0 THEN
                   DISPLAY "SORT ENDED ABNORMALLY. SORT-RETURN = ",
                       SORT-RETURN

                RETURN WORK-FILE AT END MOVE 'Y' TO EOF-FLAG
                END-IF

           END-PERFORM.


       SAVE-SORTED-RECORDS.
      *>      OPEN OUTPUT SORTED-OUTPUT-FILE
           PERFORM UNTIL EOF-OKAY
               RETURN WORK-FILE
               AT END MOVE 'Y' TO EOF-FLAG
               DISPLAY 'SORT success. SORT-RETURN: ', SORT-RETURN
           END-PERFORM

           CLOSE SORTED-OUTPUT-FILE
           CLOSE INPUT-FILE
           .

      *>      PERFORM DISPLAY-MENU
      *>      PERFORM GET-CHOICE
      *>      PERFORM PROCESS-CHOICE
      *>      STOP RUN.

      *>  DISPLAY-MENU.
      *>      DISPLAY "1. Sort By Grade".
      *>      DISPLAY "2. Sort By Name".

      *>  GET-CHOICE.
      *>      DISPLAY "Enter choice: " WITH NO ADVANCING.
      *>      ACCEPT USER-CHOICE.

      *>      IF USER-CHOICE NOT = 1 AND USER-CHOICE NOT = 2 THEN
      *>          DISPLAY "Invalid choice. Please enter 1 or 2."
      *>          PERFORM GET-CHOICE.

      *>  PROCESS-CHOICE.
      *>      IF USER-CHOICE = 1 THEN
      *>          DISPLAY "Sorting by Grade..."
      *>      ELSE
      *>          DISPLAY "Sorting by Name...".
