# Learning Notes

This document contains important concepts, observations, and lessons learned while building the Hospital Patient Analytics project.

---

## SQL

### Aggregate Functions

COUNT() → Counts rows

SUM() → Adds numeric values

AVG() → Calculates average

MAX() → Returns largest value

MIN() → Returns smallest value

## Python + SQLite

### 1. sqlite3
- `sqlite3` is a Python module that allows Python to work with SQLite databases.
- `import sqlite3` imports this module into our Python program.

### 2. Connecting to a Database
`connection = sqlite3.connect("database/Joins_sql.db")`

- `sqlite3.connect()` connects Python to the SQLite database.
- `connection` is a variable that stores this database connection.

### 3. Cursor
`cursor = connection.cursor()`

- A cursor is used to send SQL commands from Python to the database.
- The cursor is created using the database connection.

### 4. Executing SQL
`cursor.execute('SELECT * FROM Patients')`

- `execute()` sends and executes an SQL query in the database.
- The SQL inside `execute()` works like the SQL queries used in DB Browser.

### 5. Fetching Results
`patients = cursor.fetchall()`

- `fetchall()` retrieves all rows returned by the SQL query.
- Here, the returned rows are stored in the Python variable `patients`.

### 6. For Loop
`for patient in patients:`
`    print(patient)`

- A `for` loop goes through the retrieved rows one at a time.
- `patient` temporarily represents one row during each loop.

### 7. Indexing
A row such as `(101, 'John', 45)` has positions:

- `patient[0]` → 101
- `patient[1]` → John
- `patient[2]` → 45

Python indexing starts at 0.

Example:
`print(patient[1])`

This prints only the patient's name from each retrieved row.

### 8. F-Strings

- An f-string allows us to combine normal text with Python values.
- Put `f` before the quotation marks.
- Put the Python value/expression inside `{ }`.

Example:
`print(f"Patient: {patient[1]}, Age: {patient[2]}")`

If the row is `(101, 'John', 45)`, the output is:
`Patient: John, Age: 45`

Here:
- `{patient[1]}` → John
- `{patient[2]}` → 45

### 9. If and Else Statements

- `if` is used when Python needs to make a decision based on a condition.
- If the condition is True, the code inside `if` runs.
- `else` tells Python what to do when the condition is False.

Example:

`if patient[2] > 40:`
`    print("Above 40")`
`else:`
`    print("Normal age")`

Here:
- `patient[2]` represents the patient's age.
- If age > 40 → prints "Above 40".
- Otherwise → prints "Normal age".

### Indentation

Indentation determines which code belongs inside a loop or condition.

Example:

`for patient in patients:`
`    if patient[2] > 40:`
`        print("Above 40")`

Here, the `if` is inside the `for` loop, so Python checks the condition separately for every patient.

### 10. elif and Multiple Conditions

- `elif` is used when we want Python to check additional conditions.
- Python checks conditions from top to bottom.
- Once a condition is True, Python runs that block and skips the remaining conditions.

Example:

`if age < 30:`
`    print("Young Adult")`
`elif age >= 30 and age < 50:`
`    print("Adult")`
`else:`
`    print("Older Adult")`

### AND Operator

- `and` combines two conditions.
- BOTH conditions must be True for the complete condition to be True.

Example:
`age >= 30 and age < 50`

This checks whether age is between 30 and 49.

Python if / elif / else is similar to SQL CASE WHEN. It checks conditions and performs different actions depending on which condition is true. It can be used to create categories, such as patient age groups.

Counter variable: A variable that starts at a value such as 0 and is increased as a loop runs. count += 1 means increase the current value of count by 1. Counters are useful for counting records that meet particular conditions.