import 'package:flutter/material.dart';
import 'package:bcados/models/pedido.dart';

class CategoriaClasicosScreen extends StatelessWidget {
  final List<Pedido> clasicos;

  const CategoriaClasicosScreen({Key? key, required this.clasicos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clásicos'),
      ),
      body: ListView.builder(
        itemCount: clasicos.length,
        itemBuilder: (context, index) {
          final pedido = clasicos[index];
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