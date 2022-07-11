import 'package:dominion/dominion.dart';

import 'positiveMoney.dart';

class Money implements ValueObject<String, double> {
  final Either<String, double> value;

  factory Money(double value) {
    return Money._(right(value));
  }

  const Money._(this.value);

  double toDouble() => this.getOrElse(0);

  bool menorQue(PositiveMoney amount) {
    return this.toDouble() < amount.toMoney().toDouble();
  }

  PositiveMoney add(Money money) {
    return new PositiveMoney(this.toDouble() + money.toDouble());
  }

  Money substract(Money value) {
    return new Money(toDouble() - value.toDouble());
  }

  @override
  double getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  @override
  double getOrElse(double dflt) {
    return value.getOrElse(() => dflt);
  }

  @override
  bool get isValid => value.isRight();

  // bool operator ==(other) {
  //   if (identical(this, other)) {
  //     return true;
  //   } else if (other is Money) {
  //     Money that = other;
  //     return (this._valor == that._valor);
  //   } else {
  //     return false;
  //   }
  // }

  // bool equals(Money other) {
  //   return this == other;
  // }
}
