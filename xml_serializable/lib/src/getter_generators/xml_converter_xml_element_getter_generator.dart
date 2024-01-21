import 'xml_element_getter_generator.dart';

class XmlConverterXmlElementGetterGenerator extends XmlElementGetterGenerator {
  /// The name of the converter.
  final String _converter;

  const XmlConverterXmlElementGetterGenerator(
    String name,
    this._converter, {
    String? namespace,
    bool isNullable = false,
  }) : super(
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
        );
}
