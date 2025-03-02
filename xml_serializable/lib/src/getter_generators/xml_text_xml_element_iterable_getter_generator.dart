import 'xml_element_iterable_getter_generator.dart';

class XmlTextXmlElementIterableGetterGenerator
    extends XmlElementIterableGetterGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlTextXmlElementIterableGetterGenerator(
    super.name, {
    super.namespace,
    super.isNullable,
  })  : _isNullable = isNullable;

  @override
  String generateGetter(String expression) {
    final buffer = StringBuffer(super.generateGetter(expression));

    if (_isNullable) {
      buffer.write('?');
    }

    buffer.write('.map((e) => e.getText()).whereType<String>()');

    return buffer.toString();
  }
}

class NullableXmlTextXmlElementIterableGetterGenerator
    extends XmlTextXmlElementIterableGetterGenerator {
  const NullableXmlTextXmlElementIterableGetterGenerator(
    super.name, {
    super.namespace,
  }) : super(
          isNullable: true,
        );
}
