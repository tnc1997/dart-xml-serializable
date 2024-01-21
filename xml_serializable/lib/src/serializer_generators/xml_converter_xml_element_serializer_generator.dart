import 'serializer_generator.dart';

class XmlConverterXmlElementSerializerGenerator extends SerializerGenerator {
  /// The name of the converter.
  final String _converter;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlConverterXmlElementSerializerGenerator(
    this._converter, {
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

    buffer.write('const $_converter().fromXmlElement($expression)');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableXmlConverterXmlElementSerializerGenerator
    extends XmlConverterXmlElementSerializerGenerator {
  const NullableXmlConverterXmlElementSerializerGenerator(
    String converter,
  ) : super(
          converter,
          isNullable: true,
        );
}
