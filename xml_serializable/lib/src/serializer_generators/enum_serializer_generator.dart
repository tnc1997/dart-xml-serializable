import 'package:recase/recase.dart';

import 'serializer_generator.dart';

class EnumSerializerGenerator extends SerializerGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  /// The name of the type.
  final String _name;

  const EnumSerializerGenerator(
    this._name, {
    bool isNullable = false,
  }) : _isNullable = isNullable;

  @override
  String generateSerializer(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('_\$${_name}EnumMap[$expression]!');

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
      '_\$${_name}EnumMap.entries.singleWhere((${_name.camelCase}EnumMapEntry) => ${_name.camelCase}EnumMapEntry.value == $expression, orElse: () => throw ArgumentError(\'`\$$expression` is not one of the supported values: \${_\$${_name}EnumMap.values.join(\', \')}\')).key',
    );

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableEnumSerializerGenerator extends EnumSerializerGenerator {
  const NullableEnumSerializerGenerator(String name)
      : super(name, isNullable: true);
}
