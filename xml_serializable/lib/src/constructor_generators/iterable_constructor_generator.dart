import 'constructor_generator.dart';

class IterableConstructorGenerator extends ConstructorGenerator {
  /// The argument of the closure.
  static const String _closureArgument = 'e';

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  /// The generator for generating a constructor for the iterable type argument.
  final ConstructorGenerator _generator;

  const IterableConstructorGenerator(
    this._generator, {
    bool isNullable = false,
  }) : _isNullable = isNullable;

  @override
  String generateConstructor(String expression) {
    final closureArgument = IterableConstructorGenerator._closureArgument;
    final closureResult = _generator.generateConstructor(closureArgument);

    final buffer = StringBuffer(expression);

    if (closureResult != closureArgument) {
      if (_isNullable) {
        buffer.write('?');
      }

      buffer.write('.map(($closureArgument) => $closureResult)');
    }

    return buffer.toString();
  }
}

class NullableIterableConstructorGenerator
    extends IterableConstructorGenerator {
  const NullableIterableConstructorGenerator(super.generator)
      : super(isNullable: true);
}
