       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUDENT-GRADE-SORTER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE ASSIGN TO "students_records2.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SORTED-FILE ASSIGN TO "sorted_students.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SORT-WORK-FILE ASSIGN TO "SORTWORK".

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-FILE.
       01 STUDENT-RECORD.
           05 FIRST-NAME         PIC X(15).
           05 FILLER             PIC X(1).  *> Space between columns
           05 LAST-NAME          PIC X(15).
           05 FILLER             PIC X(1).  *> Space between columns
           05 GRADE              PIC 99.   *> Ensure GRADE is numeric

       FD SORTED-FILE.
       01 SORTED-RECORD          PIC X(32).

       SD SORT-WORK-FILE.
       01 SORT-WORK-RECORD.
           05 SORT-KEY           PIC 99.  *> Numeric key for sorting by GRADE
           05 STUDENT-DATA       PIC X(30).

       WORKING-STORAGE SECTION.
       01 USER-CHOICE            PIC 9 VALUE 0.
       01 USER-SUB-CHOICE        PIC 9 VALUE 0.
       01 EOF-FLAG               PIC X VALUE 'N'.
       01 TOTAL-STUDENTS         PIC 999 VALUE 0.
       01 AVERAGE-GRADE          PIC 999V99 VALUE 0.
       01 TOTAL-GRADE            PIC 9999 VALUE 0.
       01 HIGHEST-GRADE          PIC 99 VALUE 0.
       01 LOWEST-GRADE           PIC 99 VALUE 100.
       01 REPORT-LINE            PIC X(80).

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM DISPLAY-MENU
           PERFORM GET-CHOICE
           PERFORM PROCESS-CHOICE
           STOP RUN.

       DISPLAY-MENU.
           DISPLAY "----------------------------------------".
           DISPLAY "       STUDENT GRADE SORTER MENU         ".
           DISPLAY "----------------------------------------".
           DISPLAY "1. Choose Sorting Option".
           DISPLAY "2. Generate Summary Reports".
           DISPLAY "----------------------------------------".
           DISPLAY "Enter your choice (1 or 2): " WITH NO ADVANCING.

       GET-CHOICE.
           ACCEPT USER-CHOICE.

           IF USER-CHOICE NOT = 1 AND USER-CHOICE NOT = 2 THEN
               DISPLAY "Invalid choice. Please enter 1 or 2."
               PERFORM GET-CHOICE.

       PROCESS-CHOICE.
           IF USER-CHOICE = 1 THEN
               DISPLAY "----------------------------------------"
               DISPLAY "       CHOOSE SORTING OPTION            "
               DISPLAY "----------------------------------------"
               PERFORM GET-SORTING-OPTION
           ELSE
               DISPLAY "----------------------------------------"
               DISPLAY "       CHOOSE REPORT TYPE               "
               DISPLAY "----------------------------------------"
               PERFORM GET-REPORT-TYPE.

       GET-SORTING-OPTION.
           DISPLAY "1. Sort by Name"
           DISPLAY "2. Sort by Grade"
           DISPLAY "3. Sort by Course"
           DISPLAY "4. Sort by Student Number"
           DISPLAY "----------------------------------------"
           DISPLAY "Enter your choice (1-4): " WITH NO ADVANCING
           ACCEPT USER-SUB-CHOICE.

           PERFORM SORT-STUDENT-DATA
           DISPLAY "Sorting completed. Results saved to sorted_students.txt".

       GET-REPORT-TYPE.
           DISPLAY "1. Generate Detailed Report"
           DISPLAY "2. Generate Summary Report"
           DISPLAY "----------------------------------------"
           DISPLAY "Enter your choice (1 or 2): " WITH NO ADVANCING
           ACCEPT USER-SUB-CHOICE.

           IF USER-SUB-CHOICE = 1 THEN
               PERFORM GENERATE-DETAILED-REPORT
           ELSE IF USER-SUB-CHOICE = 2 THEN
               PERFORM GENERATE-SUMMARY-REPORT
           ELSE
               DISPLAY "Invalid choice. Please enter 1 or 2."
               PERFORM GET-REPORT-TYPE.

       SORT-STUDENT-DATA.
           EVALUATE USER-SUB-CHOICE
               WHEN 1
                   MOVE FIRST-NAME OF STUDENT-RECORD TO SORT-KEY
                   MOVE FIRST-NAME OF STUDENT-RECORD TO STUDENT-DATA
                   SORT SORT-WORK-FILE
                       ON ASCENDING KEY SORT-KEY
                       USING STUDENT-FILE
                       GIVING SORTED-FILE
               WHEN 2
                   MOVE GRADE OF STUDENT-RECORD TO SORT-KEY
                   MOVE FIRST-NAME OF STUDENT-RECORD TO STUDENT-DATA
                   SORT SORT-WORK-FILE
                       ON ASCENDING KEY SORT-KEY
                       USING STUDENT-FILE
                       GIVING SORTED-FILE
               WHEN 3
                   MOVE GRADE OF STUDENT-RECORD TO SORT-KEY
                   MOVE FIRST-NAME OF STUDENT-RECORD TO STUDENT-DATA
                   SORT SORT-WORK-FILE
                       ON ASCENDING KEY SORT-KEY
                       USING STUDENT-FILE
                       GIVING SORTED-FILE
           END-EVALUATE.

       GENERATE-DETAILED-REPORT.
           OPEN INPUT STUDENT-FILE.
           MOVE "N" TO EOF-FLAG.
           DISPLAY "----------------------------------------".
           DISPLAY "       DETAILED STUDENT REPORT           ".
           DISPLAY "----------------------------------------".
           DISPLAY "FIRST NAME      LAST NAME       GRADE".
           DISPLAY "----------------------------------------".
           PERFORM UNTIL EOF-FLAG = "Y"
               READ STUDENT-FILE
                   AT END MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       DISPLAY FIRST-NAME "  " LAST-NAME "  " GRADE
                       ADD 1 TO TOTAL-STUDENTS
                       ADD GRADE TO TOTAL-GRADE
                       IF GRADE > HIGHEST-GRADE
                           MOVE GRADE TO HIGHEST-GRADE
                       END-IF
                       IF GRADE < LOWEST-GRADE
                           MOVE GRADE TO LOWEST-GRADE
                       END-IF
           END-PERFORM.
           CLOSE STUDENT-FILE.

           COMPUTE AVERAGE-GRADE = TOTAL-GRADE / TOTAL-STUDENTS.
           DISPLAY "----------------------------------------".
           DISPLAY "TOTAL STUDENTS: " TOTAL-STUDENTS.
           DISPLAY "AVERAGE GRADE:  " AVERAGE-GRADE.
           DISPLAY "HIGHEST GRADE:  " HIGHEST-GRADE.
           DISPLAY "LOWEST GRADE:   " LOWEST-GRADE.
           DISPLAY "----------------------------------------".

       GENERATE-SUMMARY-REPORT.
           OPEN INPUT STUDENT-FILE.
           MOVE "N" TO EOF-FLAG.
           PERFORM UNTIL EOF-FLAG = "Y"
               READ STUDENT-FILE
                   AT END MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       ADD 1 TO TOTAL-STUDENTS
                       ADD GRADE TO TOTAL-GRADE
                       IF GRADE > HIGHEST-GRADE
                           MOVE GRADE TO HIGHEST-GRADE
                       END-IF
                       IF GRADE < LOWEST-GRADE
                           MOVE GRADE TO LOWEST-GRADE
                       END-IF
           END-PERFORM.
           CLOSE STUDENT-FILE.

           COMPUTE AVERAGE-GRADE = TOTAL-GRADE / TOTAL-STUDENTS.
           DISPLAY "----------------------------------------".
           DISPLAY "       SUMMARY STUDENT REPORT           ".
           DISPLAY "----------------------------------------".
           DISPLAY "TOTAL STUDENTS: " TOTAL-STUDENTS.
           DISPLAY "AVERAGE GRADE:  " AVERAGE-GRADE.
           DISPLAY "HIGHEST GRADE:  " HIGHEST-GRADE.
           DISPLAY "LOWEST GRADE:   " LOWEST-GRADE.
           DISPLAY "----------------------------------------".