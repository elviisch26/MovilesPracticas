import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecuperarSanguchitos extends StatefulWidget {
  const RecuperarSanguchitos({Key? key}) : super(key: key);

  @override
  _RecuperarSanguchitosState createState() => _RecuperarSanguchitosState();
}

class _RecuperarSanguchitosState extends State<RecuperarSanguchitos> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Aquí puedes mostrar un mensaje de éxito o redirigir a otra pantalla
      print('Se ha enviado un correo electrónico para restablecer la contraseña');

      // Redirigir a otra pantalla después de enviar el correo de recuperación
      Navigator.pushReplacementNamed(context, '/Login.dart');
    } catch (e) {
      // Manejar errores, como por ejemplo si el correo no está registrado
      print('Error al enviar el correo para restablecer la contraseña: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/OIG.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
                SizedBox(height: 20),
                const Text(
                  "Recuperar",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese su correo electrónico';
                    }
                    if (!RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b').hasMatch(value)) {
                      return 'Por favor, ingrese un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _resetPassword(_emailController.text);
                      }
                    },
                    child: const Text('Recuperar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
