# Learning Notes

This document contains important concepts, observations, and lessons learned while building the Hospital Patient Analytics project.

---

## SQL

### Aggregate Functions

- `COUNT()` → Counts rows
- `SUM()` → Adds numeric values
- `AVG()` → Calculates an average
- `MAX()` → Returns the largest value
- `MIN()` → Returns the smallest value

---

## Python + SQLite

### 1. sqlite3

`sqlite3` is a Python module that allows Python to work with SQLite databases.

```python
import sqlite3
```

- `import sqlite3` imports the module into the Python program.

---

### 2. Connecting to a Database

```python
connection = sqlite3.connect("database/Joins_sql.db")
```

- `sqlite3.connect()` connects Python to the SQLite database.
- `connection` is a variable that stores the database connection.

---

### 3. Cursor

```python
cursor = connection.cursor()
```

- A cursor is used to send SQL commands from Python to the database.
- The cursor is created using the database connection.

---

### 4. Executing SQL

```python
cursor.execute("SELECT * FROM Patients")
```

- `execute()` sends and executes an SQL query in the database.
- The SQL inside `execute()` works like the SQL queries used in DB Browser.

---

### 5. Fetching Results

```python
patients = cursor.fetchall()
```

- `fetchall()` retrieves all rows returned by the SQL query.
- The returned rows are stored in a Python variable such as `patients`.

A common sequence is:

```text
Execute SQL query
        ↓
Fetch results
        ↓
Store results in Python
```

---

### 6. For Loops

```python
for patient in patients:
    print(patient)
```

- A `for` loop goes through the retrieved rows one at a time.
- `patient` temporarily represents one row during each iteration of the loop.

---

### 7. Indexing Database Rows

A patient row such as:

```python
(101, "John", 45)
```

contains values at different positions:

- `patient[0]` → 101
- `patient[1]` → John
- `patient[2]` → 45

Python indexing starts at `0`.

Example:

```python
print(patient[1])
```

This accesses the patient's name.

There is also an important difference between storing one value and storing the entire row:

```python
oldest_age = patient[2]
```

stores only the patient's age.

Whereas:

```python
oldest_patient = patient
```

stores the complete patient row.

---

### 8. F-Strings

F-strings allow normal text and Python values to be displayed together.

Put `f` before the quotation marks and place Python values or expressions inside `{ }`.

Example:

```python
print(f"Patient: {patient[1]}, Age: {patient[2]}")
```

If the row is:

```python
(101, "John", 45)
```

the output is:

```text
Patient: John, Age: 45
```

Here:

- `{patient[1]}` → John
- `{patient[2]}` → 45

---

### 9. If, Elif, and Else Statements

Python uses `if`, `elif`, and `else` to make decisions based on conditions.

Example:

```python
if patient[2] <= 30:
    print("Young adult")
elif patient[2] <= 50:
    print("Adult")
else:
    print("Older adult")
```

- `if` checks the first condition.
- `elif` checks another condition if the previous condition was False.
- `else` runs when the previous conditions are False.
- Python checks conditions from top to bottom.
- Once a condition is True, Python runs that block and skips the remaining conditions.

Python `if / elif / else` is conceptually similar to SQL `CASE WHEN`. Both can be used to create categories based on conditions.

---

### 10. AND Operator

`and` combines two conditions.

Both conditions must be True for the complete condition to be True.

Example:

```python
age >= 30 and age < 50
```

This checks whether the age is at least 30 and less than 50.

---

### 11. Indentation

Indentation determines which code belongs inside a loop, condition, or function.

Example:

```python
for patient in patients:
    if patient[2] > 40:
        print("Above 40")
```

Here, the `if` statement is inside the `for` loop, so Python checks the condition separately for every patient.

Indentation is especially important when working with loops and `return`.

For example, if `return` is placed inside a loop, the function can stop during an iteration before all rows have been processed.

Code placed outside the loop runs after the loop has finished processing all rows.

---

### 12. Counter Variables

A counter variable starts at a value such as `0` and increases while a loop runs.

Example:

```python
adult_count = 0

for patient in patients:
    if patient[2] <= 50:
        adult_count += 1
```

`+= 1` means:

```python
adult_count = adult_count + 1
```

Counters are useful for counting records that meet particular conditions.

---

### 13. SELECT vs WHERE

In SQL:

```sql
SELECT * FROM Patients WHERE Age > 30;
```

- `SELECT` determines which columns are returned.
- `WHERE` determines which rows are returned.

---

### 14. Execute → Fetch → Loop

A common pattern when using SQLite with Python is:

```python
cursor.execute("SELECT * FROM Patients WHERE Age > 30")
patients_above_30 = cursor.fetchall()

for patient in patients_above_30:
    print(patient)
```

The sequence is:

```text
Execute SQL query
        ↓
Fetch returned rows
        ↓
Process the rows in Python
```

---

### 15. Parameterized Queries

Instead of placing values directly inside an SQL query, Python values can be passed using `?` placeholders.

Example with one parameter:

```python
minimum_age = 30

cursor.execute(
    "SELECT * FROM Patients WHERE Age > ?",
    (minimum_age,)
)
```

- `?` is a placeholder for a value supplied by Python.
- `(minimum_age,)` is a one-item tuple.

Example with two parameters:

```python
minimum_age = 30
maximum_age = 50

cursor.execute(
    "SELECT * FROM Patients WHERE Age > ? AND Age < ?",
    (minimum_age, maximum_age)
)
```

The values are supplied in the same order as the `?` placeholders.

The first `?` receives `minimum_age`.

The second `?` receives `maximum_age`.

---

### 16. Functions and Parameters

Functions organize code into reusable blocks.

Example:

```python
def get_patients_by_age_range(minimum_age, maximum_age):
    cursor.execute(
        "SELECT * FROM Patients WHERE Age > ? AND Age < ?",
        (minimum_age, maximum_age)
    )

    patients_in_range = cursor.fetchall()
    return patients_in_range
```

Here:

- `minimum_age` and `maximum_age` are parameters.
- The function executes a parameterized SQL query.
- `fetchall()` retrieves the matching patient rows.
- `return` sends the result out of the function.

The function can then be called using:

```python
age_range_patients = get_patients_by_age_range(20, 60)
```

The values `20` and `60` are passed into the function as inputs.

A useful way to remember the flow is:

```text
INPUTS
   ↓
FUNCTION
   ↓
DOES SOME WORK
   ↓
RETURN
   ↓
VARIABLE RECEIVES RESULT
```

---

### 17. Default Parameters

A function can have default values for its parameters.

Example:

```python
def classify_patients(patients, young_max=30, adult_max=50):
```

Here:

- `young_max` has a default value of `30`.
- `adult_max` has a default value of `50`.

Calling:

```python
classify_patients(patients)
```

uses the default values.

The defaults can also be changed when calling the function:

```python
classify_patients(patients, 25, 60)
```

This makes the function reusable with different classification limits.

---

### 18. Return Values

`return` sends a result from inside a function back to the part of the program that called it.

Example:

```python
def calculate_average_age(patients):
    ...
    return average_age
```

The returned value can be stored in another variable:

```python
average_age_in_range = calculate_average_age(age_range_patients)
```

This means:

```text
Function calculates result
        ↓
return sends result out
        ↓
Variable receives result
```

Once `return` executes, the function ends.

---

### 19. len()

`len()` counts the number of items in a collection.

For fetched database results:

```python
len(age_range_patients)
```

gives the number of patient rows returned by the query.

Example:

```python
print(f"Number of patients in this age group: {len(age_range_patients)}")
```

---

### 20. Accumulating Values

An accumulator keeps a running total.

Example:

```python
total_age = 0

for patient in patients:
    total_age += patient[2]
```

This:

```python
total_age += patient[2]
```

means the same as:

```python
total_age = total_age + patient[2]
```

Because it is inside the loop, each patient's age is added to the running total.

---

### 21. Calculating an Average

After the loop has calculated the complete total:

```python
average_age = total_age / len(patients)
```

The average should be calculated after the loop because the final total is needed before performing the division.

---

### 22. Handling Empty Results

A query may sometimes return zero rows.

Before dividing by the number of patients, check whether the collection contains any patients.

Example:

```python
if len(patients) > 0:
    average_age = total_age / len(patients)
    return average_age
else:
    return "No patients to calculate average age"
```

This prevents:

```text
ZeroDivisionError
```

because Python is not asked to divide by zero when no patients are returned.

---

### 23. Finding the Oldest Patient Using Python

Python can find the oldest patient by comparing ages while looping through the retrieved patient records.

```python
oldest_age = 0
oldest_patient = None

for patient in patients:
    if patient[2] > oldest_age:
        oldest_age = patient[2]
        oldest_patient = patient
```

Here:

- `oldest_age` stores the highest age found so far.
- `oldest_patient` stores the complete row belonging to that patient.
- Python compares each patient's age with the current `oldest_age`.
- When a larger age is found, both variables are updated.

The patient's name and age can then be displayed using:

```python
print(f"Oldest patient: {oldest_patient[1]}, Age: {oldest_patient[2]}")
```

This demonstrates the difference between:

```python
patient[2]
```

which represents only the patient's age,

and:

```python
patient
```

which represents the entire patient row.

---

### 24. Closing the Database Connection

After all database operations are complete:

```python
connection.close()
```

This closes the SQLite database connection.

It should be placed after the program has finished using the database.

---

## Key Takeaways

- SQL is used to retrieve and filter data from the SQLite database.
- Python can connect to SQLite using the `sqlite3` module.
- A cursor allows Python to execute SQL queries.
- `fetchall()` retrieves returned database rows so they can be processed in Python.
- A `for` loop processes returned rows one at a time.
- Indexing allows individual values to be accessed from a database row.
- F-strings make Python output easier to read.
- `if`, `elif`, and `else` allow Python to make decisions based on conditions.
- Counters can be used to count records belonging to different categories.
- Functions organize code into reusable blocks.
- Parameters allow functions to work with different input values.
- Default parameters provide values that can be used unless different values are supplied.
- Parameterized SQL queries use placeholders to pass Python values into SQL queries.
- `return` sends a result out of a function so it can be stored and reused.
- `len()` can be used to count the number of rows returned by a query.
- Accumulators can be used to calculate totals.
- Average calculations should be performed after the required total has been calculated.
- Empty query results should be handled before division to avoid `ZeroDivisionError`.
- Indentation determines whether code belongs inside or outside loops, conditions, and functions.
- Python can perform additional analysis on data retrieved from SQL, such as identifying the oldest patient.
- Database connections should be closed after database operations are complete.