import 'package:dartz/dartz.dart';
import 'package:dominion/dominion.dart';
import 'package:grocery_list/core/domain/nome.dart';
import 'package:grocery_list/core/domain/preco.dart';
import 'package:uuid/uuid.dart';

class Produto implements Entity<String> {
  final String id;
  final Nome nome;
  final Preco preco;

  factory Produto(Nome nome, Preco preco) {
    var uuid = Uuid();
    var id = uuid.v4();
    return Produto._(id, nome, preco);
  }

  const Produto._(this.id, this.nome, this.preco);
}
