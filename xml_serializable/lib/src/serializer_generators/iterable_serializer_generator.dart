import 'serializer_generator.dart';

class IterableSerializerGenerator extends SerializerGenerator {
  /// The argument of the closure.
  static const String _closureArgument = 'e';

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  /// The generator for generating a serializer for the iterable type argument.
  final SerializerGenerator _generator;

  const IterableSerializerGenerator(
    this._generator, {
    bool isNullable = false,
  }) : _isNullable = isNullable;

  @override
  String generateSerializer(String expression) {
    final closureArgument = IterableSerializerGenerator._closureArgument;
    final closureResult = _generator.generateSerializer(closureArgument);

    final buffer = StringBuffer(expression);

    if (closureResult != closureArgument) {
      if (_isNullable) {
        buffer.write('?');
      }

      buffer.write('.map(($closureArgument) => $closureResult)');
    }

    return buffer.toString();
  }

  @override
  String generateDeserializer(String expression) {
    final closureArgument = IterableSerializerGenerator._closureArgument;
    final closureResult = _generator.generateDeserializer(closureArgument);

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

class NullableIterableSerializerGenerator extends IterableSerializerGenerator {
  const NullableIterableSerializerGenerator(super.generator)
      : super(isNullable: true);
}

class ListSerializerGenerator extends IterableSerializerGenerator {
  const ListSerializerGenerator(
    super.generator, {
    super.isNullable,
  });

  @override
  String generateDeserializer(String expression) {
    final closureArgument = IterableSerializerGenerator._closureArgument;
    final closureResult = _generator.generateDeserializer(closureArgument);

    final buffer = StringBuffer(expression);

    if (_isNullable) {
      buffer.write('?');
    }

    if (closureResult != closureArgument) {
      buffer.write('.map(($closureArgument) => $closureResult)');
    }

    buffer.write('.toList()');

    return buffer.toString();
  }
}

class NullableListSerializerGenerator extends ListSerializerGenerator {
  const NullableListSerializerGenerator(super.generator)
      : super(isNullable: true);
}

class SetSerializerGenerator extends IterableSerializerGenerator {
  const SetSerializerGenerator(
    super.generator, {
    super.isNullable,
  });

  @override
  String generateDeserializer(String expression) {
    final closureArgument = IterableSerializerGenerator._closureArgument;
    final closureResult = _generator.generateDeserializer(closureArgument);

    final buffer = StringBuffer(expression);

    if (_isNullable) {
      buffer.write('?');
    }

    if (closureResult != closureArgument) {
      buffer.write('.map(($closureArgument) => $closureResult)');
    }

    buffer.write('.toSet()');

    return buffer.toString();
  }
}

class NullableSetSerializerGenerator extends SetSerializerGenerator {
  const NullableSetSerializerGenerator(super.generator)
      : super(isNullable: true);
}
