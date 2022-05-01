import 'builder_generator.dart';

class XmlAttributeBuilderGenerator extends BuilderGenerator {
  /// The name of the attribute.
  final String _name;

  /// The namespace of the attribute.
  final String? _namespace;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlAttributeBuilderGenerator(
    this._name, {
    String? namespace,
    bool isNullable = false,
  })  : _namespace = namespace,
        _isNullable = isNullable;

  @override
  String generateBuilder(String expression, {String builder = 'builder'}) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write('$builder.attribute(\'$_name\', $expression');

    if (_namespace != null) {
      buffer.write(', namespace: \'$_namespace\'');
    }

    buffer.write(');');

    if (_isNullable) {
      buffer.write(' }');
    }

    return buffer.toString();
  }
}

class NullableXmlAttributeBuilderGenerator
    extends XmlAttributeBuilderGenerator {
  const NullableXmlAttributeBuilderGenerator(
    String name, {
    String? namespace,
  }) : super(name, namespace: namespace, isNullable: true);
}
