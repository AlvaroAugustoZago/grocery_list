import 'package:dartz/dartz.dart';
import 'package:dominion/dominion.dart';
import 'package:grocery_list/core/domain/produto.dart';
import 'package:uuid/uuid.dart';

class ListaCompras implements Entity<String> {
  final String id;
  final List<Produto> produtos;

  const ListaCompras._(this.id, this.produtos);

  void adicionar(Produto produto) {
    produtos.add(produto);
  }

  static ListaCompras emBranco() {
    var uuid = Uuid();
    var id = uuid.v4();
    return ListaCompras._(id, List.empty(growable: true));
  }
}
