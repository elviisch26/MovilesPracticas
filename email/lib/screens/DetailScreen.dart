// ignore_for_file: file_names

import 'package:email/model/backend.dart';
import 'package:email/model/email.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // Marcar como leído al abrir la pantalla de detalle
    Backend().markEmailAsRead(email.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${email.from}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Text(
              email.subject,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text(
              email.dateTime.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 184, 122, 122), 
              ),
            ),
            const SizedBox(
                height:
                    16),
            Text(
              email.body,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
