import 'xml_element_getter_generator.dart';

class XmlTextXmlElementGetterGenerator extends XmlElementGetterGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlTextXmlElementGetterGenerator(
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

    buffer.write('.getText()');

    if (!_isNullable) {
      buffer.write('!');
    }

    return buffer.toString();
  }
}

class NullableXmlTextXmlElementGetterGenerator
    extends XmlTextXmlElementGetterGenerator {
  const NullableXmlTextXmlElementGetterGenerator(
    String name, {
    String? namespace,
  }) : super(
          name,
          namespace: namespace,
          isNullable: true,
        );
}
