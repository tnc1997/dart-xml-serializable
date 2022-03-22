import 'builder_generator.dart';

class IterableBuilderGenerator extends BuilderGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  /// The generator for generating a constructor for the iterable type argument.
  final BuilderGenerator _generator;

  const IterableBuilderGenerator(
    this._generator, {
    bool isNullable = false,
  }) : _isNullable = isNullable;

  @override
  String generateBuilder(String expression, {String builder = 'builder'}) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write('for (final value in $expression) { ');

    buffer.write(_generator.generateBuilder('value'));

    buffer.write(' }');

    if (_isNullable) {
      buffer.write(' }');
    }

    return buffer.toString();
  }
}

class NullableIterableBuilderGenerator extends IterableBuilderGenerator {
  const NullableIterableBuilderGenerator(BuilderGenerator generator)
      : super(generator, isNullable: true);
}
