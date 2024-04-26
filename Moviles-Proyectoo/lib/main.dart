// main.dart
import 'package:flutter/material.dart';
import 'package:bcados/screens/home_screen.dart';
import 'package:bcados/screens/Login.dart';
import 'package:bcados/screens/Register.dart';
import 'package:bcados/screens/payment.dart';
import 'screens/Recuperar.dart';  // Importa la pantalla que creamos

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Cambia MyHomePage por HomeScreen como pantalla principal
      home: SignUpScreen(),
      routes: {
        '/Recuperar.dart': (context) => RecuperarSanguchitos(),
        '/Register.dart': (context) => SignUpScreen(),
        '/Clasicos.dart': (context) => HomeScreen(),
        '/payment.dart': (context) => PaymentScreen(),
        '/Login.dart': (context) => LoginScreen(),
      },
    );
  }
}
