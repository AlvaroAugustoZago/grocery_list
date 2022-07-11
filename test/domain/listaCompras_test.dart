import 'package:grocery_list/core/domain/nome.dart';
import 'package:grocery_list/core/domain/preco.dart';
import 'package:grocery_list/core/domain/produto.dart';
import 'package:grocery_list/core/infra/money/positiveMoney.dart';
import 'package:test/test.dart';
import 'package:grocery_list/core/domain/listaCompras.dart';

void main() {
  group('Lista de Compras', () {
    test('Deve criar uma lista de compras em branco', () {
      ListaCompras listaCompras = ListaCompras.emBranco();
      expect(listaCompras.produtos.length, 0);
    });

    test('Deve adicionar item na lista de compras', () {
      ListaCompras listaCompras = ListaCompras.emBranco();

      Nome nome = Nome("Pão");
      Preco preco = Preco(PositiveMoney(1.44));
      Produto produto = Produto(nome, preco);

      listaCompras.adicionar(produto);
      expect(listaCompras.produtos.length, 1);
      expect(listaCompras.produtos[0].nome, nome);
      expect(listaCompras.produtos[0].preco, preco);
    });
  });
}
