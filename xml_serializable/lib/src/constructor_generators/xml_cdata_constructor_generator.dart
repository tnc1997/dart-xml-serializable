import 'constructor_generator.dart';

class XmlCDATAConstructorGenerator extends ConstructorGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlCDATAConstructorGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateConstructor(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('XmlCDATA($expression)');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableXmlCDATAConstructorGenerator
    extends XmlCDATAConstructorGenerator {
  const NullableXmlCDATAConstructorGenerator() : super(isNullable: true);
}
