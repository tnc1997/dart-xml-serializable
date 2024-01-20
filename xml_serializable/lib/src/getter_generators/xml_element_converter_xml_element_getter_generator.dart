import 'xml_element_getter_generator.dart';

class XmlElementConverterXmlElementGetterGenerator
    extends XmlElementGetterGenerator {
  /// The name of the converter.
  final String _converter;

  const XmlElementConverterXmlElementGetterGenerator(
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

class NullableXmlElementConverterXmlElementGetterGenerator
    extends XmlElementConverterXmlElementGetterGenerator {
  const NullableXmlElementConverterXmlElementGetterGenerator(
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
