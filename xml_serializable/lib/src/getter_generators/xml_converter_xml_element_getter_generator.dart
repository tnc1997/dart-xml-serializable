import 'xml_element_getter_generator.dart';

class XmlConverterXmlElementGetterGenerator extends XmlElementGetterGenerator {
  /// The name of the converter.
  final String _converter;

  /// If `false` (the default) then the type of the converter does not represent a nullable type.
  final bool _isConverterNullable;

  const XmlConverterXmlElementGetterGenerator(
    String name,
    this._converter, {
    String? namespace,
    bool isNullable = false,
    bool isConverterNullable = false,
  })  : _isConverterNullable = isConverterNullable,
        super(
          name,
          namespace: namespace,
          isNullable: isNullable,
        );
}

class NullableXmlConverterXmlElementGetterGenerator
    extends XmlConverterXmlElementGetterGenerator {
  const NullableXmlConverterXmlElementGetterGenerator(
    String name,
    String converter, {
    String? namespace,
  }) : super(
          name,
          converter,
          namespace: namespace,
          isNullable: true,
          isConverterNullable: true,
        );
}
