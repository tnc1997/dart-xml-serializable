import 'getter_generator.dart';

class InnerXmlGetterGenerator extends GetterGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const InnerXmlGetterGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateGetter(String expression) {
    final buffer = StringBuffer(expression);

    buffer.write('.getInnerXml()');

    if (!_isNullable) {
      buffer.write('!');
    }

    return buffer.toString();
  }
}

class NullableInnerXmlGetterGenerator extends InnerXmlGetterGenerator {
  const NullableInnerXmlGetterGenerator() : super(isNullable: true);
}
