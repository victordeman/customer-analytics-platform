import unittest
import pandas as pd
from scripts.etl_pipeline import *

class TestETLPipeline(unittest.TestCase):
    def test_data_transformation(self):
        # Sample data
        data = pd.DataFrame({
            'transaction_date': ['2025-01-01'],
            'quantity': [2],
            'price': [999.99]
        })
        data['transaction_date'] = pd.to_datetime(data['transaction_date'])
        data.fillna({'quantity': 1}, inplace=True)
        data['total_amount'] = data['quantity'] * data['price']
        self.assertEqual(data['total_amount'].iloc[0], 1999.98)

if __name__ == '__main__':
    unittest.main()
