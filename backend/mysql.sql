cartview
---------------------------

SELECT items.*,cart.* ,SUM(items.i_price) as sumprice,COUNT(items.i_id) as countitems ,
(SUM(items.i_price)-(SUM(items.i_price)*items.i_discount/100)) as discountsumprice FROM cart 
INNER JOIN items ON items.i_id=cart.cart_itemid AND cart.cart_userid=42 
WHERE cart.cart_orders=0
GROUP BY cart.cart_itemid,cart.cart_userid;

detailsorderview
-------------------

CREATE OR REPLACE VIEW detailsorderview AS 
SELECT items.*,cart.*, SUM(items.i_price) as sumpriceitems,count(items.i_id) as countitems,
 (SUM(items.i_price)-(SUM(items.i_price)*items.i_discount/100)) as sumpricediscountitems FROM cart 
 INNER JOIN items ON items.i_id=cart.cart_itemid AND cart.cart_userid=42 
 WHERE cart.cart_orders!=0 
 GROUP BY cart.cart_itemid,cart.cart_userid,cart.cart_orders;

ordersaddressview
---------------------
CREATE OR REPLACE VIEW ordersaddressview AS 
SELECT orders.*,address.* FROM orders 
LEFT JOIN address ON orders.orders_userid=address.address_userid 
AND orders.orders_address=address.address_id;