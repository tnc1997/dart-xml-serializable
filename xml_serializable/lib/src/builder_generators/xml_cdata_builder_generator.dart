import 'builder_generator.dart';

class XmlCDATABuilderGenerator extends BuilderGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlCDATABuilderGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateBuilder(String expression, {String builder = 'builder'}) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write('$builder.cdata($expression);');

    if (_isNullable) {
      buffer.write(' }');
    }

    return buffer.toString();
  }
}

class NullableXmlCDATABuilderGenerator extends XmlCDATABuilderGenerator {
  const NullableXmlCDATABuilderGenerator() : super(isNullable: true);
}
