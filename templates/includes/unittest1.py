import unittest

from flask import Flask
from flask_testing import TestCase

from app import app, mysql


class AppTestCase(TestCase):
    def create_app(self):
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False
        return app

    def setUp(self):
        self.app = self.create_app()
        self.client = self.app.test_client()
        self.ctx = self.app.app_context()
        self.ctx.push()
        self.connection = mysql.connection

    def tearDown(self):
        self.ctx.pop()

    def test_register(self):
        response = self.client.post('/register', data={
            'name': 'John Doe',
            'email': 'john@example.com',
            'username': 'johndoe',
            'password': 'password123',
            'mobile': '1234567890'
        }, follow_redirects=True)
        self.assert200(response)
        self.assertIn(b'You are now registered and can login', response.data)

    def test_register_with_existing_username(self):
        # Register a user with the same username as the previous test
        response = self.client.post('/register', data={
            'name': 'Jane Smith',
            'email': 'jane@example.com',
            'username': 'johndoe',  # Existing username
            'password': 'password456',
            'mobile': '9876543210'
        }, follow_redirects=True)
        self.assert200(response)
        self.assertIn(b'Username not found', response.data)

    def test_login(self):
        response = self.client.post('/login', data={
            'username': 'johndoe',
            'password': 'password123'
        }, follow_redirects=True)
        self.assert200(response)
        self.assertIn(b'Welcome, John Doe', response.data)

    def test_login_with_invalid_credentials(self):
        response = self.client.post('/login', data={
            'username': 'johndoe',
            'password': 'wrongpassword'
        }, follow_redirects=True)
        self.assert200(response)
        self.assertIn(b'Incorrect password', response.data)

    def test_logout(self):
        # Log in first to have an active session
        self.client.post('/login', data={
            'username': 'johndoe',
            'password': 'password123'
        })
        response = self.client.get('/out', follow_redirects=True)
        self.assert200(response)
        self.assertIn(b'You are logged out', response.data)
        # Verify that the session is cleared
        with self.app.session_transaction() as session:
            self.assertNotIn('logged_in', session)
            self.assertNotIn('uid', session)
            self.assertNotIn('s_name', session)


if __name__ == '__main__':
    unittest.main()
