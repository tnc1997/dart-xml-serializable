import 'xml_element_iterable_getter_generator.dart';

class XmlConverterXmlElementIterableGetterGenerator
    extends XmlElementIterableGetterGenerator {
  /// The name of the converter.
  final String _converter;

  const XmlConverterXmlElementIterableGetterGenerator(
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

class NullableXmlConverterXmlElementIterableGetterGenerator
    extends XmlConverterXmlElementIterableGetterGenerator {
  const NullableXmlConverterXmlElementIterableGetterGenerator(
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
