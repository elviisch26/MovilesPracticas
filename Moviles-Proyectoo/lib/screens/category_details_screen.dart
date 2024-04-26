
import 'package:flutter/material.dart';
import 'package:bcados/models/pedido.dart';
import 'package:bcados/screens/orden_confirmation_screen.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String categoryName;
  final String categoryImage;

  CategoryDetailsScreen({
    required this.categoryName,
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    List<Pedido> products;

    switch (categoryName) {
      case 'Clasicos':
        products = clasicos;
        break;
      case 'Premiun':
        products = premium;
        break;
      case 'Bebidas':
        products = bebidas;
        break;
      default:
        products = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                categoryName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      product.nombre,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Precio: \$${product.precio.toStringAsFixed(2)}'),
                        Text('Descripción: ${product.descripcion}'),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        _addToCart(product, context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Producto agregado al carrito: ${product.nombre}'),
                          ),
                        );
                      },
                      child: Text('Agregar al Carrito'),
                    ),
                    onTap: () {
                      // Puedes navegar a la pantalla de detalles del producto
                    },
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Ir al carrito cuando se hace clic en este botón
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: _cartItems),
                  ),
                );
              },
              child: Text('Ver Carrito'),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart(Pedido product, BuildContext context) {
    _cartItems.add({
      'id': product.id,
      'name': product.nombre,
      'price': product.precio,
      'quantity': 1,
    });
  }
}

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      _cartItems[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_cartItems[index]['quantity'] > 1) {
        _cartItems[index]['quantity']--;
      }
    });
  }

  double calculateSubtotal() {
    double subtotal = 0;
    for (var item in _cartItems) {
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
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          // ... Agrega la imagen del producto aquí ...
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.cartItems[index]['name']),
                              Text('\$${widget.cartItems[index]['price']}'),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () => _removeItem(index),
                          ),
                          Text('${widget.cartItems[index]['quantity']}'),
                          IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () => _incrementQuantity(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () => _decrementQuantity(index),
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
            ElevatedButton(
              onPressed: () {
                // Ir a la pantalla de confirmación cuando se hace clic en este botón
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ConfirmationScreen(cartItems: widget.cartItems),
                  ),
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

List<Map<String, dynamic>> _cartItems=[];