import 'serializer_generator.dart';

class XmlConverterSerializerGenerator extends SerializerGenerator {
  /// The name of the converter.
  final String _converter;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlConverterSerializerGenerator(
    this._converter, {
    bool isNullable = false,
  }) : _isNullable = isNullable;

  @override
  String generateSerializer(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('const $_converter().toXml($expression)');

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

    buffer.write('const $_converter().fromXml($expression)');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableXmlConverterSerializerGenerator
    extends XmlConverterSerializerGenerator {
  const NullableXmlConverterSerializerGenerator(
    String converter,
  ) : super(
          converter,
          isNullable: true,
        );
}
