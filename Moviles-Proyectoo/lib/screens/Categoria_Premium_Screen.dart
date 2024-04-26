import 'package:flutter/material.dart';
import 'package:bcados/models/pedido.dart';

class CategoriaPremiumScreen extends StatelessWidget {
  final List<Pedido> premium;

  const CategoriaPremiumScreen({Key? key, required this.premium}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premium'),
      ),
      body: ListView.builder(
        itemCount: premium.length,
        itemBuilder: (context, index) {
          final pedido = premium[index];
          return ListTile(
            title: Text(pedido.nombre),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Precio: \$${pedido.precio.toString()}'),
                Text('Descripción: ${pedido.descripcion}'),
              ],
            ),
            leading: Image.asset(
              pedido.imagen,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            onTap: () {
              // Implementa la navegación a los detalles del pedido si es necesario.
              // Navigator.push(context, MaterialPageRoute(...));
            },
          );
        },
    ),
);
}
}