import 'xml_element_getter_generator.dart';

class XmlTextXmlElementGetterGenerator extends XmlElementGetterGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlTextXmlElementGetterGenerator(
    super.name, {
    super.namespace,
    super.isNullable,
  }) : _isNullable = isNullable;

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
    super.name, {
    super.namespace,
  }) : super(
          isNullable: true,
        );
}
