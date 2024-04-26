import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Método de pago'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image
              Image.asset(
                'assets/logo.png', // Adjust the path accordingly
                width: 250, // Adjust the width as needed
                height: 200, // Adjust the height as needed
                // You can add more properties like fit, alignment, etc.
              ),
              SizedBox(height: 20),
              const Text(
                'Delivery Express',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // TODO: Open WhatsApp for electronic transfer
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  backgroundColor: Colors.green, // Adjust the color as needed
                ),
                child: const Text(
                  'Transferencia Electrónica',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Adjust the text color as needed
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información de la cuenta:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Número de cuenta: XXXX-XXXX-XXXX-XXXX'),
                    Text('Tipo de cuenta: Cuenta Corriente'),
                    Text('Titular de la cuenta: Nombre del Titular'),
                    // Add other relevant account information here
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Lanzar la URL de WhatsApp al presionar el botón "Enviar comprobante"
                  _launchWhatsApp();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  backgroundColor: Colors.blue, // Adjust the color as needed
                ),
                child: const Text(
                  'Enviar comprobante',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Adjust the text color as needed
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para lanzar la URL de WhatsApp
  // Función para lanzar WhatsApp
  _launchWhatsApp() async {
    const phoneNumber = '593980671513'; // Número de teléfono de WhatsApp
    const message = 'Hola, ¡Delivery Express! aquí tienes mi comprobante de pago. ✌️'; // Mensaje predeterminado

    // Lanzar WhatsApp
    var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=${Uri.parse(message)}";
    await launch(whatsappUrl);
  }
}
