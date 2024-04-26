import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {'name': 'Producto 1', 'price': 6.25, 'quantity': 1},
    // Agrega más productos al carrito según sea necesario
  ];

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  double calculateSubtotal() {
    double subtotal = 0;
    for (var item in cartItems) {
      subtotal += item['price'] * item['quantity'];
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de compras'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/product_1.jpg',
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cartItems[index]['name']),
                              Text('\$${cartItems[index]['price']}'),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () => _removeItem(index),
                          ),
                          Text('${cartItems[index]['quantity']}'),
                          IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () => _incrementQuantity(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal'),
                Text('\$${calculateSubtotal().toStringAsFixed(2)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text('\$${calculateSubtotal().toStringAsFixed(2)}'),
              ],
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Continuar'),
              onPressed: () {
                // Aquí puedes implementar la lógica para continuar con la compra
              },
            ),
          ],
        ),
      ),
    );
  }
}
