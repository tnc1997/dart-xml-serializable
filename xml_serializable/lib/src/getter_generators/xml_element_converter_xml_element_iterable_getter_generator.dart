import 'xml_element_iterable_getter_generator.dart';

class XmlElementConverterXmlElementIterableGetterGenerator
    extends XmlElementIterableGetterGenerator {
  /// The name of the converter.
  final String _converter;

  const XmlElementConverterXmlElementIterableGetterGenerator(
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

class NullableXmlElementConverterXmlElementIterableGetterGenerator
    extends XmlElementConverterXmlElementIterableGetterGenerator {
  const NullableXmlElementConverterXmlElementIterableGetterGenerator(
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
