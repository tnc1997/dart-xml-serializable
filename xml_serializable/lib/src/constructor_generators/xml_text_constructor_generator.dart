import 'constructor_generator.dart';

class XmlTextConstructorGenerator extends ConstructorGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlTextConstructorGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateConstructor(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('XmlText($expression)');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableXmlTextConstructorGenerator extends XmlTextConstructorGenerator {
  const NullableXmlTextConstructorGenerator() : super(isNullable: true);
}
