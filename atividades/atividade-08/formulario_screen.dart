import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  String? validarData(String? value) {
    if (value == null || value.isEmpty) return 'Informe a data';
    try {
      DateFormat("dd-MM-yyyy").parseStrict(value);
      return null;
    } catch (e) {
      return 'Data inválida! Use o formato dd-mm-aaaa';
    }
  }

  String? validarEmail(String? value) {
    if (value == null || value.isEmpty) return 'Informe um e-mail';
    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(value) ? null : 'E-mail inválido';
  }

  String? validarCPF(String? value) {
    if (value == null || value.isEmpty) return 'Informe o CPF';
    return CPFValidator.isValid(value) ? null : 'CPF inválido';
  }

  String? validarValor(String? value) {
    if (value == null || value.isEmpty) return 'Informe um valor';
    final regex = RegExp(r'^\d+(\.\d{1,2})?$');
    return regex.hasMatch(value) ? null : 'Valor inválido! Use formato 99.99';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário com Validação")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _dataController,
                decoration: InputDecoration(labelText: "Data (dd-mm-aaaa)"),
                keyboardType: TextInputType.datetime,
                validator: validarData,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: validarEmail,
              ),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(labelText: "CPF"),
                keyboardType: TextInputType.number,
                validator: validarCPF,
              ),
              TextFormField(
                controller: _valorController,
                decoration: InputDecoration(labelText: "Valor (99.99)"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: validarValor,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Formulário válido! ✅")),
                    );
                  }
                },
                child: Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
