import 'package:flutter/material.dart';
import 'formulario_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Inicial")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormularioScreen()),
            );
          },
          child: Text("Abrir Formulário"),
        ),
      ),
    );
  }
}
