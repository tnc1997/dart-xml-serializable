import 'constructor_generator.dart';

class InnerXmlConstructorGenerator extends ConstructorGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const InnerXmlConstructorGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateConstructor(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('XmlDocument.parse($expression).rootElement');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableInnerXmlConstructorGenerator extends InnerXmlConstructorGenerator {
  const NullableInnerXmlConstructorGenerator() : super(isNullable: true);
}
