import 'package:dominion/dominion.dart';

import 'money.dart';
import 'moneyExceptions.dart';

class PositiveMoney
    implements ValueObject<MoneyShouldBePositiveException, Money> {
  final Either<MoneyShouldBePositiveException, Money> value;

  factory PositiveMoney(double valor) {
    if (valor < 0) {
      return PositiveMoney._(
          left(MoneyShouldBePositiveException("Valor deve ser maior que 0")));
    }
    return PositiveMoney._(right(new Money(valor)));
  }

  const PositiveMoney._(this.value);

  Money toMoney() => this.getOrCrash();

  PositiveMoney add(PositiveMoney positiveAmount) {
    return this.getOrCrash().add(positiveAmount.getOrCrash());
  }

  Money substract(PositiveMoney positiveAmount) {
    return this.getOrCrash().substract(positiveAmount.getOrCrash());
  }

  @override
  Money getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  @override
  Money getOrElse(Money dflt) {
    return value.getOrElse(() => dflt);
  }

  @override
  bool get isValid => value.isRight();
}
