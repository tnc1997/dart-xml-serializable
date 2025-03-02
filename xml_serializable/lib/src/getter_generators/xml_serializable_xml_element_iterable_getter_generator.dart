import 'xml_element_iterable_getter_generator.dart';

class XmlSerializableXmlElementIterableGetterGenerator
    extends XmlElementIterableGetterGenerator {
  const XmlSerializableXmlElementIterableGetterGenerator(
    super.name, {
    super.namespace,
    super.isNullable,
  });
}

class NullableXmlSerializableXmlElementIterableGetterGenerator
    extends XmlSerializableXmlElementIterableGetterGenerator {
  const NullableXmlSerializableXmlElementIterableGetterGenerator(
    super.name, {
    super.namespace,
  }) : super(
          isNullable: true,
        );
}
