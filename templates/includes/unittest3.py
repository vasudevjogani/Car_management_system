import unittest

from flask import Flask, render_template
from flask_testing import TestCase


class TestApp(TestCase):
    def create_app(self):
        app = Flask(__name__)
        app.config['TESTING'] = True
        return app

    def test_home_page(self):
        response = self.client.get('/')
        self.assert200(response)
        self.assertTemplateUsed('home.html')

    def test_view_product_page(self):
        response = self.client.get('/audi?view=1')
        self.assert200(response)
        self.assertTemplateUsed('model_viewproduct.html')

    def test_order_modal(self):
        response = self.client.get('/audi?view=1')
        self.assert200(response)
        self.assertTemplateUsed('model_viewproduct.html')
        self.assertTemplateUsed('modal_order.html')

    # This is Sample Unit Test. more tests will be added for other pages and functionalities

if __name__ == '__main__':
    unittest.main()
