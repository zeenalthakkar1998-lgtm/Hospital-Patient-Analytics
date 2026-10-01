# 🏥 Hospital Patient Analytics

A healthcare data analytics portfolio project using **SQL, SQLite, and Python** to explore patient data, perform database analysis, and build practical skills in healthcare data management and analytics.

---

## 📌 Project Overview

This project explores healthcare and patient data using SQL and Python.

The project began with SQL fundamentals and progressed through joins, subqueries, CASE statements, and Common Table Expressions (CTEs). Python was then connected to SQLite to retrieve and analyze patient records programmatically.

The project demonstrates the progression from querying healthcare data directly in SQL to using Python for reusable database analysis.

---

## 🎯 Project Objectives

- Practice SQL using healthcare-related datasets
- Develop analytical thinking through patient and hospital data
- Apply intermediate SQL concepts to database analysis
- Connect Python with SQLite databases
- Analyze database records using Python
- Practice writing reusable Python functions and parameterized SQL queries
- Use Git and GitHub for version control and project documentation
- Build a structured healthcare analytics portfolio project

---

## 🛠️ Technologies Used

- SQL
- SQLite
- Python
- Python `sqlite3`
- DB Browser for SQLite
- Git
- GitHub
- Visual Studio Code

---

## 🗂️ Repository Structure

```text
Hospital-Patient-Analytics/
│
├── data/
│   └── raw/
│       └── healthcare_dataset.csv
│
├── database/
│   ├── hospital_patient_analytics.db
│   ├── hospital_patient_analytics.sqbpro
│   └── Joins_sql.db
│
├── docs/
│   ├── Learning_Notes.md
│   ├── Progress_Log.md
│   ├── Project_Roadmap.md
│   └── Resume_Project_Summary.md
│
├── python/
│   └── Scripts/
│       └── 01_database_connection.py
│
├── sql/
│   ├── 01_basic_queries.sql
│   ├── 02_joins.sql
│   └── 03_subqueries_case_cte.sql
│
├── .gitignore
└── README.md
```

---

## 🧮 SQL Analysis

### SQL Fundamentals

The project includes practice and analysis using:

- SELECT
- WHERE
- AND / OR
- ORDER BY
- DISTINCT
- LIMIT
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING

### Intermediate SQL

The project also includes:

- INNER JOIN
- LEFT JOIN
- SELF JOIN
- Subqueries
- CASE WHEN
- Common Table Expressions (CTEs)

These concepts were applied to healthcare-related data to retrieve, filter, summarize, and combine patient information.

---

## 🐍 Python + SQLite Analysis

Python was connected directly to an SQLite database using the built-in `sqlite3` module.

The Python portion of the project includes:

- Establishing an SQLite database connection
- Creating and using a database cursor
- Executing SQL queries from Python
- Retrieving records using `fetchall()`
- Iterating through patient records
- Using conditional logic and counters
- Creating reusable functions
- Using function parameters and return values
- Executing parameterized SQL queries
- Filtering patients by age range
- Counting returned patient records
- Calculating average patient age
- Handling empty query results
- Identifying the oldest patient
- Closing the database connection correctly

---

## 📚 Documentation

The repository includes supporting documentation covering both the technical work and learning progression:

- **Learning Notes** – SQL, Python, and SQLite concepts practiced during the project
- **Progress Log** – chronological record of project development
- **Project Roadmap** – completed project phases and final portfolio tasks
- **Resume Project Summary** – concise project description for professional use

---

## 💡 Skills Demonstrated

This project demonstrates practical experience with:

- SQL querying and database analysis
- Healthcare data exploration
- Relational database concepts
- SQLite database management
- Python database connectivity
- Python control flow and functions
- Parameterized SQL queries
- Basic descriptive analysis using Python
- Git and GitHub version control
- Technical documentation
- Organizing a data analytics project repository

---

## ▶️ Running the Python Analysis

From the project root directory, run:

```bash
python python/Scripts/01_database_connection.py
```

The script connects to the SQLite database, retrieves patient records, performs age-based analysis, calculates summary information, and displays the results in the terminal.

---

## 📈 Project Status

**Core project completed.**

Completed components include:

- SQL fundamentals
- Intermediate SQL
- SQLite database work
- Python + SQLite integration
- Patient-level Python analysis
- Project documentation
- Repository organization

The project is maintained as part of my healthcare data analytics and Health Informatics portfolio.