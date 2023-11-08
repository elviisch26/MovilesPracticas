
// ignore_for_file: file_names

import 'package:email/model/email.dart';
import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const EmailWidget({
    Key? key,
    required this.email,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ListTile(
        title: Text(email.subject),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(email.from),
            Text(
              email.dateTime.toString(),
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        leading: Icon(
          email.read ? Icons.check : Icons.clear,
          color: email.read ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}