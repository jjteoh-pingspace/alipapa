# `/orders`

functional requirements:

for customer

- view orders
  - within same order, order items are grouped by merchant
- rate completed orders

for merchants

- view orders
- update orders to completed

rules:

- customers can only view own orders
- customers can only rate completed orders
- merchants can only view his/her related orders
- merchants can ony update pending orders to completed (for simplicity, once completed, all selected merchant's items in the order will be assumed completed)
- an order can contains multiple merchants products, all order items must complete first, in order to complete the order
