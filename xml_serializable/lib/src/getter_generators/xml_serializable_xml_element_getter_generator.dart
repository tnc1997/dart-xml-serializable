import 'xml_element_getter_generator.dart';

class XmlSerializableXmlElementGetterGenerator
    extends XmlElementGetterGenerator {
  const XmlSerializableXmlElementGetterGenerator(
    super.name, {
    super.namespace,
    super.isNullable,
  });
}

class NullableXmlSerializableXmlElementGetterGenerator
    extends XmlSerializableXmlElementGetterGenerator {
  const NullableXmlSerializableXmlElementGetterGenerator(
    super.name, {
    super.namespace,
  }) : super(
          isNullable: true,
        );
}
