// ignore_for_file: file_names

import 'package:email/model/backend.dart';
import 'package:email/model/email.dart';
import 'package:email/screens/DetailScreen.dart';
import 'package:email/widgets/EmailWidget.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Email> emails = []; // Lista de emails

  @override
  void initState() {
    super.initState();
    // Obtener los emails al inicio
    emails = Backend().getEmails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Correos recibidos'),
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(emails[index].id.toString()),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              // Eliminar email al hacer swipe
              setState(() {
                Backend().deleteEmail(emails[index].id);
                emails.removeAt(index);

                // Verificar si no quedan correos electrónicos y mostrar un mensaje
                if (emails.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Todos los correos electrónicos han sido eliminados',
                        style: TextStyle(color: Colors.red),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  );
                }
              });
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(email: emails[index]),
                  ),
                );
              },
              onLongPress: () {
                setState(() {
                  Backend().markEmailAsRead(emails[index].id);
                  emails[index].read = true;
                });
              },
              child: EmailWidget(
                email: emails[index],
                onTap: () {
                  // Marcar como leído con tap
                  setState(() {
                    Backend().markEmailAsRead(emails[index].id);
                    emails[index].read = true;
                  });

                  // Navegar a la pantalla de detalle
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(email: emails[index]),
                    ),
                  );
                },
                onLongPress: () {
                  // Marcar como leído con Long Press
                  setState(() {
                    Backend().markEmailAsRead(emails[index].id);
                    emails[index].read = true;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}