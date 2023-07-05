import unittest

from flask import Flask
from flask_testing import TestCase

from app import app


class AppTestCase(TestCase):
    def create_app(self):
        return app

    def setUp(self):
        self.client = self.app.test_client()

    def test_audi_route(self):
        response = self.client.get('/audi')
        self.assertEqual(response.status_code, 200)

    def test_bmw_route(self):
        response = self.client.get('/bmw')
        self.assertEqual(response.status_code, 200)

    def test_mercedes_route(self):
        response = self.client.get('/mercedes')
        self.assertEqual(response.status_code, 200)

    def test_ferrari_route(self):
        response = self.client.get('/ferrari')
        self.assertEqual(response.status_code, 200)

    def test_invalid_route(self):
        response = self.client.get('/invalid')
        self.assertEqual(response.status_code, 404)


if __name__ == '__main__':
    unittest.main()
