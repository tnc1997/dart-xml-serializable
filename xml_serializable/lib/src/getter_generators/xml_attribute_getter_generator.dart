import 'getter_generator.dart';

class XmlAttributeGetterGenerator extends GetterGenerator {
  /// The name of the attribute.
  final String _name;

  /// The namespace of the attribute.
  final String? _namespace;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlAttributeGetterGenerator(
    this._name, {
    String? namespace,
    bool isNullable = false,
  })  : _namespace = namespace,
        _isNullable = isNullable;

  @override
  String generateGetter(String expression) {
    final buffer = StringBuffer(expression);

    buffer.write('.getAttribute(\'$_name\'');

    if (_namespace != null) {
      buffer.write(', namespace: \'$_namespace\'');
    }

    buffer.write(')');

    if (!_isNullable) {
      buffer.write('!');
    }

    return buffer.toString();
  }
}

class NullableXmlAttributeGetterGenerator extends XmlAttributeGetterGenerator {
  const NullableXmlAttributeGetterGenerator(
    String name, {
    String? namespace,
  }) : super(
          name,
          namespace: namespace,
          isNullable: true,
        );
}
