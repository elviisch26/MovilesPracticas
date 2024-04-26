import 'package:flutter/material.dart';
import 'package:bcados/screens/payment.dart'; 

class ConfirmationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  ConfirmationScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;

    for (var item in cartItems) {
      totalAmount += item['price'] * item['quantity'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmación de Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalles del Pedido:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          // ... Puedes personalizar la visualización de los detalles del pedido aquí ...
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cartItems[index]['name']),
                              Text('\$${cartItems[index]['price']}'),
                              Text('Cantidad: ${cartItems[index]['quantity']}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Por favor, tome una captura de pantalla y envíela al completar el pago.',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()), // Redirigir a PaymentScreen
                );
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
