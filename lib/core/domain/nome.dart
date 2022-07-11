import 'package:dartz/dartz.dart';
import 'package:dominion/dominion.dart';

class Nome implements ValueObject<String, String> {
  final Either<String, String> value;

  factory Nome(String value) {
    if (value.isEmpty) {
      return Nome._(left('Nome não pode ser em branco'));
    }
    return Nome._(right(value));
  }

  const Nome._(this.value);

  @override
  String getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  @override
  String getOrElse(String dflt) {
    return value.getOrElse(() => dflt);
  }

  @override
  bool get isValid => value.isRight();
}
