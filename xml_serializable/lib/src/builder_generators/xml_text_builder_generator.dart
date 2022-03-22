import 'builder_generator.dart';

class XmlTextBuilderGenerator extends BuilderGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlTextBuilderGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateBuilder(String expression, {String builder = 'builder'}) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write('$builder.text($expression);');

    if (_isNullable) {
      buffer.write(' }');
    }

    return buffer.toString();
  }
}

class NullableXmlTextBuilderGenerator extends XmlTextBuilderGenerator {
  const NullableXmlTextBuilderGenerator() : super(isNullable: true);
}
