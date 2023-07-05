import unittest

import mysql.connector

# Establish a connection to the MySQL database
db_connection = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="menshut"
)

# Create a cursor object to execute SQL queries

cursor = db_connection.cursor()


class TestSQLStatements(unittest.TestCase):
    def test_admin_table(self):
        # Execute a SELECT query on the admin table
        cursor.execute("SELECT * FROM admin")
        result = cursor.fetchall()
        
        # Assert that the query returned some rows
        self.assertGreater(len(result), 0)
        
    def test_orders_table(self):
        # Execute a SELECT query on the orders table
        cursor.execute("SELECT * FROM orders")
        result = cursor.fetchall()
        
        # Assert that the query returned some rows
        self.assertGreater(len(result), 0)
        
    def test_products_table(self):
        # Execute a SELECT query on the products table
        cursor.execute("SELECT * FROM products")
        result = cursor.fetchall()
        
        # Assert that the query returned some rows
        self.assertGreater(len(result), 0)
        
    def test_product_level_table(self):
        # Execute a SELECT query on the product_level table
        cursor.execute("SELECT * FROM product_level")
        result = cursor.fetchall()
        
        # Assert that the query returned some rows
        self.assertGreater(len(result), 0)
        
    def test_product_view_table(self):
        # Execute a SELECT query on the product_view table
        cursor.execute("SELECT * FROM product_view")
        result = cursor.fetchall()
        
        # Assert that the query returned some rows
        self.assertGreater(len(result), 0)
        
    def test_users_table(self):
        # Execute a SELECT query on the users table
        cursor.execute("SELECT * FROM users")
        result = cursor.fetchall()
        
        # Assert that the query returned some rows
        self.assertGreater(len(result), 0)


if __name__ == '__main__':
    unittest.main()
