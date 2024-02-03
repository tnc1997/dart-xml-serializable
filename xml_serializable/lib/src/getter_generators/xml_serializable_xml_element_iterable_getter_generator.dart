import 'xml_element_iterable_getter_generator.dart';

class XmlSerializableXmlElementIterableGetterGenerator
    extends XmlElementIterableGetterGenerator {
  const XmlSerializableXmlElementIterableGetterGenerator(
    String name, {
    String? namespace,
    bool isNullable = false,
  }) : super(
          name,
          namespace: namespace,
          isNullable: isNullable,
        );
}

class NullableXmlSerializableXmlElementIterableGetterGenerator
    extends XmlSerializableXmlElementIterableGetterGenerator {
  const NullableXmlSerializableXmlElementIterableGetterGenerator(
    String name, {
    String? namespace,
  }) : super(
          name,
          namespace: namespace,
          isNullable: true,
        );
}
