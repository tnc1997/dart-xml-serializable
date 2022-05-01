import 'serializer_generator.dart';

class BoolSerializerGenerator extends SerializerGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const BoolSerializerGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateSerializer(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('$expression == true ? \'true\' : \'false\'');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }

  @override
  String generateDeserializer(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write(
      '$expression == \'true\' || $expression == \'1\' ? true : $expression == \'false\' || $expression == \'0\' ? false : throw FormatException(\'Invalid bool format\', $expression)',
    );

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableBoolSerializerGenerator extends BoolSerializerGenerator {
  const NullableBoolSerializerGenerator() : super(isNullable: true);
}
