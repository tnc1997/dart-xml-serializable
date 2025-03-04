import 'package:recase/recase.dart';

import 'serializer_generator.dart';

class EnumSerializerGenerator extends SerializerGenerator {
  /// The name of the type.
  final String _type;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const EnumSerializerGenerator(
    this._type, {
    bool isNullable = false,
  }) : _isNullable = isNullable;

  @override
  String generateSerializer(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('\$${_type}EnumMap[$expression]!');

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
      '\$${_type}EnumMap.entries.singleWhere((${_type.camelCase}EnumMapEntry) => ${_type.camelCase}EnumMapEntry.value == $expression, orElse: () => throw ArgumentError(\'`\$$expression` is not one of the supported values: \${\$${_type}EnumMap.values.join(\', \')}\')).key',
    );

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableEnumSerializerGenerator extends EnumSerializerGenerator {
  const NullableEnumSerializerGenerator(super.name) : super(isNullable: true);
}
