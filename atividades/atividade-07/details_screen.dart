
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> crypto;

  DetailsScreen({required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(crypto["nome"])),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(crypto["imagem"], width: 100, height: 100),
            ),
            SizedBox(height: 20),
            Text("Nome: ${crypto["nome"]}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Símbolo: ${crypto["simbolo"]}",
                style: TextStyle(fontSize: 16)),
            Text("Preço: \$${crypto["preco"]}", style: TextStyle(fontSize: 16)),
            Text("Variação 24h: ${crypto["variacao_24h"]}%",
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
