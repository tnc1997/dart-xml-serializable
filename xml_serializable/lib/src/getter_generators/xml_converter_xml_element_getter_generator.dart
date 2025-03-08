import 'xml_element_getter_generator.dart';

class XmlConverterXmlElementGetterGenerator extends XmlElementGetterGenerator {
  /// The name of the converter.
  // ignore: unused_field
  final String _converter;

  /// If `false` (the default) then the type of the converter does not represent a nullable type.
  // ignore: unused_field
  final bool _isConverterNullable;

  const XmlConverterXmlElementGetterGenerator(
    super.name,
    this._converter, {
    super.namespace,
    super.isNullable,
    bool isConverterNullable = false,
  }) : _isConverterNullable = isConverterNullable;
}

class NullableXmlConverterXmlElementGetterGenerator
    extends XmlConverterXmlElementGetterGenerator {
  const NullableXmlConverterXmlElementGetterGenerator(
    super.name,
    super.converter, {
    super.namespace,
  }) : super(
          isNullable: true,
          isConverterNullable: true,
        );
}
