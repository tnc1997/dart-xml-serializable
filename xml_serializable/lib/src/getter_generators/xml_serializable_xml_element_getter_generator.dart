import 'xml_element_getter_generator.dart';

class XmlSerializableXmlElementGetterGenerator
    extends XmlElementGetterGenerator {
  const XmlSerializableXmlElementGetterGenerator(
    String name, {
    String? namespace,
    bool isNullable = false,
  }) : super(
          name,
          namespace: namespace,
          isNullable: isNullable,
        );
}

class NullableXmlSerializableXmlElementGetterGenerator
    extends XmlSerializableXmlElementGetterGenerator {
  const NullableXmlSerializableXmlElementGetterGenerator(
    String name, {
    String? namespace,
  }) : super(
          name,
          namespace: namespace,
          isNullable: true,
        );
}
