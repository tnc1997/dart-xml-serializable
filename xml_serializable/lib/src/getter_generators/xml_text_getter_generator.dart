import 'getter_generator.dart';

class XmlTextGetterGenerator extends GetterGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlTextGetterGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateGetter(String expression) {
    final buffer = StringBuffer(expression);

    buffer.write('.getText()');

    if (!_isNullable) {
      buffer.write('!');
    }

    return buffer.toString();
  }
}

class NullableXmlTextGetterGenerator extends XmlTextGetterGenerator {
  const NullableXmlTextGetterGenerator() : super(isNullable: true);
}
