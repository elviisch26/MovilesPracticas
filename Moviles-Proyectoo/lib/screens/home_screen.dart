import 'package:flutter/material.dart';
import 'package:bcados/screens/category_details_screen.dart';
import 'package:bcados/widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Bienvenido a Bcados Rappys',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Centra el título en la AppBar
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título del negocio y pequeña descripción
            SizedBox(height: 10),
            Text(
              'Explora el mundo del sabor con Sándwich Delicias Variadas! Desde clásicos reconfortantes hasta creaciones audaces, ofrecemos una experiencia única para los amantes de los sabores. ¡Sumérgete en nuestro menú diverso y descubre la magia entre dos rebanadas!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20), // Espaciado entre el texto y las categorías
            CategoryItem(
              categoryName: 'Clasicos',
              imageName: 'clasi.png',
              onTap: () {
                navigateToCategoryDetails(context, 'Clasicos');
              },
            ),
            CategoryItem(
              categoryName: 'Premiun',
              imageName: 'premiun.png',
              onTap: () {
                navigateToCategoryDetails(context, 'Premiun');
              },
            ),
            CategoryItem(
              categoryName: 'Bebidas',
              imageName: 'bebidas.png',
              onTap: () {
                navigateToCategoryDetails(context, 'Bebidas');
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToCategoryDetails(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetailsScreen(
          categoryName: category,
          categoryImage: '',
        ),
      ),
    );
  }
}
