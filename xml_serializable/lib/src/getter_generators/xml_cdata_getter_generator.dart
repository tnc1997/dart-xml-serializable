import 'getter_generator.dart';

class XmlCDATAGetterGenerator extends GetterGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlCDATAGetterGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateGetter(String expression) {
    final buffer = StringBuffer(expression);

    buffer.write('.getCDATA()');

    if (!_isNullable) {
      buffer.write('!');
    }

    return buffer.toString();
  }
}

class NullableXmlCDATAGetterGenerator extends XmlCDATAGetterGenerator {
  const NullableXmlCDATAGetterGenerator() : super(isNullable: true);
}
