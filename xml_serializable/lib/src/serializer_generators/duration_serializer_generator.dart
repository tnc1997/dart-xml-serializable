import 'serializer_generator.dart';

class DurationSerializerGenerator extends SerializerGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const DurationSerializerGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateSerializer(String expression, Set<String> addedMembers) {
    final buffer = StringBuffer(expression);

    if (_isNullable) {
      buffer.write('?');
    }

    buffer.write('.inMicroseconds.toString()');

    return buffer.toString();
  }

  @override
  String generateDeserializer(String expression, Set<String> addedMembers) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('Duration(microseconds: int.parse($expression))');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableDurationSerializerGenerator extends DurationSerializerGenerator {
  const NullableDurationSerializerGenerator() : super(isNullable: true);
}
