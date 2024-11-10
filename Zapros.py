import psycopg2

connection = psycopg2.connect(user="me", password="Asg02031973", host="some-postgres", database="Gorsky")
cursor = connection.cursor()
cursor.execute('SELECT * FROM test_table WHERE LENGTH(name) < 6 AND (age = (select MAX(age) FROM test_table) OR age = (select MIN(age) FROM test_table))')
results = cursor.fetchall()
for row in results:
    print(row)
cursor.close()
connection.close()
