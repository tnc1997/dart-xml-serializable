import 'xml_element_iterable_getter_generator.dart';

class XmlTextXmlElementIterableGetterGenerator
    extends XmlElementIterableGetterGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlTextXmlElementIterableGetterGenerator(
    String name, {
    String? namespace,
    bool isNullable = false,
  })  : _isNullable = isNullable,
        super(
          name,
          namespace: namespace,
          isNullable: isNullable,
        );

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
    String name, {
    String? namespace,
  }) : super(
          name,
          namespace: namespace,
          isNullable: true,
        );
}
