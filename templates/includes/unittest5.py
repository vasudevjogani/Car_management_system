import unittest

from flask import Flask
from flask_testing import TestCase

from app import app


class TestRouting(TestCase):
    def create_app(self):
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False
        return app

    def test_admin_login_route(self):
        response = self.client.get('/admin_login')
        self.assert200(response)
        

    def test_admin_logout_route(self):
        response = self.client.get('/admin_out')
        self.assertRedirects(response, '/admin_login')
        

    def test_admin_dashboard_route(self):
        response = self.client.get('/admin')
        self.assertRedirects(response, '/admin_login')
        

    def test_manage_orders_route(self):
        response = self.client.get('/orders')
        self.assertRedirects(response, '/admin_login')
        

    def test_manage_users_route(self):
        response = self.client.get('/users')
        self.assertRedirects(response, '/admin_login')
        

    def test_add_product_route(self):
        response = self.client.get('/admin_add_product')
        self.assertRedirects(response, '/admin_login')
        

    def test_edit_product_route(self):
        response = self.client.get('/edit_product/1')
        self.assertRedirects(response, '/admin_login')
      

if __name__ == '__main__':
    unittest.main()
