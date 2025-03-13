# 🌟 Student Grade Sorter - COBOL Project 🚀

## 📌 Overview

The **Student Grade Sorter** is a COBOL-based program designed to efficiently sort and analyze student records based on various criteria such as **name, grade, course, and student number**. Additionally, it provides **detailed and summary reports** to give insights into student performance.

This project demonstrates the power of **COBOL in data processing**, showcasing its ability to handle structured data and perform efficient sorting operations. The program reads from an input file, sorts the data, and generates an organized output file.

---

## 🛠 Features

✅ **Sorting Options** - Sort students by **Name, Grade, Course, or Student Number** ✅ **Report Generation** - Generate **detailed and summary reports** of student performance ✅ **User-Friendly Interface** - Simple menu-driven navigation ✅ **File Handling** - Reads from and writes to external text files ✅ **Scalability** - Easily expandable to handle additional fields and sorting criteria

---

## 📂 File Structure

```
📦 Student-Grade-Sorter
 ┣ 📜 students_records2.txt  # Input file with student data
 ┣ 📜 sorted_students.txt     # Output file with sorted student data
 ┣ 📜 sortwork.dat            # Temporary sort work file
 ┣ 📜 student_grade_sorter.cbl # COBOL source code
 ┗ 📜 README.md               # Documentation (this file)
```

---

## 🚀 How It Works

1️⃣ **User selects an option**: Sorting or Report Generation 2️⃣ **Sorting**: Sort students based on **Name, Grade, Course, or Student Number** 3️⃣ **Report Generation**: Choose between **Detailed Report** (full data) or **Summary Report** (average, highest, lowest grade, etc.) 4️⃣ **Data Processing**: Reads student data from `students_records2.txt` 5️⃣ **Output**: Saves the sorted records in `sorted_students.txt`

---

## 🎯 Sorting Options

| Option | Sorting Criteria       |
| ------ | ---------------------- |
| 1️⃣    | Sort by Name           |
| 2️⃣    | Sort by Grade          |
| 3️⃣    | Sort by Course         |
| 4️⃣    | Sort by Student Number |

---

## 📊 Report Generation

### 1️⃣ Detailed Report

- Displays **each student’s full record**
- Sorted as per the chosen criterion
- Output is stored in `sorted_students.txt`

### 2️⃣ Summary Report

- Calculates **total students**, **average grade**, **highest & lowest grades**
- Provides performance insights
- Output displayed on the screen and stored in `sorted_students_summary.txt`

---

## 🏗 COBOL Code Breakdown

### 🔹 File Handling

- ``: Reads student data from `students_records2.txt`
- ``: Stores sorted results in `sorted_students.txt`
- ``: Temporary file used for sorting

### 🔹 Sorting Mechanism

- Uses **SORT** functionality in COBOL
- Sorts based on **ascending order** of the chosen key

### 🔹 Menu Navigation

- Uses **ACCEPT** and **DISPLAY** to interact with users
- Validates user input to ensure correct choices

---

## 🔧 How to Run

### Prerequisites

🔹 COBOL Compiler (OpenCOBOL/GnuCOBOL recommended) installed 🔹 Basic understanding of COBOL syntax 🔹 A text editor for modifying input data

### Steps to Execute

1️⃣ Compile the COBOL program:

```bash
cobc -x student_grade_sorter.cbl -o student_grade_sorter
```

2️⃣ Run the program:

```bash
./student_grade_sorter
```

3️⃣ Follow the on-screen menu to select sorting or report generation.

---

## 🔮 Future Enhancements

🚀 **Add graphical visualization** (bar charts, pie charts for reports) 🚀 **Integrate a database** for dynamic data retrieval 🚀 **Web-based interface** for easier interaction 🚀 **AI-powered grading insights** using machine learning

---

## 💡 Final Thoughts

This project highlights the efficiency of **COBOL in structured data management**. With its robust sorting and reporting capabilities, it serves as a valuable tool for academic institutions and administrators handling student records.

**Contributions & feedback are welcome! Feel free to enhance and adapt it for more functionalities.** 🚀✨

---

## 📩 Contact

📧 **Email**: mailto\:terrorbite.com\
🔗 **GitHub**: https://github.com/TerrorBite-Capacitie\
🌍 **Website**: (https://terrorbite.com

---

🚀 **Keep coding and innovating!** 💡

