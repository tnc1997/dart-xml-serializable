import 'serializer_generator.dart';

class XmlSerializableXmlElementSerializerGenerator extends SerializerGenerator {
  /// The name of the type (including the prefix where applicable).
  final String _name;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlSerializableXmlElementSerializerGenerator(
    this._name, {
    bool isNullable = false,
  }) : _isNullable = isNullable;

  @override
  String generateSerializer(String expression) => expression;

  @override
  String generateDeserializer(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('$_name.fromXmlElement($expression)');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableXmlSerializableXmlElementSerializerGenerator
    extends XmlSerializableXmlElementSerializerGenerator {
  const NullableXmlSerializableXmlElementSerializerGenerator(
    String name,
  ) : super(
          name,
          isNullable: true,
        );
}
