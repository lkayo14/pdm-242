import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  // Método para conversão para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  // Método para conversão para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  // Método para conversão para JSON
  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  Dependente dep1 = Dependente("João");
  Dependente dep2 = Dependente("Maria");
  Dependente dep3 = Dependente("Pedro");
  Dependente dep4 = Dependente("Ana");

  // 2. Criar varios objetos Funcionario
  Funcionario func1 = Funcionario("Carlos", [dep1, dep2]);
  Funcionario func2 = Funcionario("Fernanda", [dep3]);
  Funcionario func3 = Funcionario("Roberto", [dep4]);

  // 3. Associar os Dependentes criados aos respectivos Funcionarios
  // Já feito ao criar os objetos Funcionario com os dependentes

  // 4. Criar uma lista de Funcionarios
  List<Funcionario> funcionarios = [func1, func2, func3];

  // 5. Criar um objeto EquipeProjeto chamando o método construtor
  EquipeProjeto equipe = EquipeProjeto("Projeto X", funcionarios);

  // 6. Printar no formato JSON o objeto EquipeProjeto
  String jsonString = jsonEncode(equipe.toJson());
  print(jsonString);
}
