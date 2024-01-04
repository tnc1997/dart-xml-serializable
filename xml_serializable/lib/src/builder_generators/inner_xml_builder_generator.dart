import 'builder_generator.dart';

class InnerXmlBuilderGenerator extends BuilderGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const InnerXmlBuilderGenerator({bool isNullable = false})
      : _isNullable = isNullable;

  @override
  String generateBuilder(String expression, {String builder = 'builder'}) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write('$builder.xml($expression);');

    if (_isNullable) {
      buffer.write(' }');
    }

    return buffer.toString();
  }
}

class NullableInnerXmlBuilderGenerator extends InnerXmlBuilderGenerator {
  const NullableInnerXmlBuilderGenerator() : super(isNullable: true);
}
