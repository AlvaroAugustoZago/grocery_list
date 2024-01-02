import 'package:dartz/dartz.dart';
import 'package:dominion/dominion.dart';
import 'package:grocery_list/core/infra/money/money.dart';

import '../infra/money/positiveMoney.dart';

class Preco implements ValueObject<String, Money> {
  final Either<String, Money> value;

  factory Preco(PositiveMoney value) {
    print("debug: value");
    if (value.isValid) {
      return Preco._(left('Preco invalido'));
    }
    return Preco._(right(value.toMoney()));
  }

  const Preco._(this.value);

  @override
  Money getOrElse(Money dflt) {
    return value.getOrElse(() => dflt);
  }

  @override
  bool get isValid => value.isRight();

  @override
  Money getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }
}
