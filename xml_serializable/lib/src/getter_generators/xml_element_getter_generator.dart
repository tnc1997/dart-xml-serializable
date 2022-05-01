import 'getter_generator.dart';

class XmlSerializableXmlElementGetterGenerator extends GetterGenerator {
  /// The name of the element.
  final String _name;

  /// The namespace of the element.
  final String? _namespace;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlSerializableXmlElementGetterGenerator(
    this._name, {
    String? namespace,
    bool isNullable = false,
  })  : _namespace = namespace,
        _isNullable = isNullable;

  @override
  String generateGetter(String expression) {
    final buffer = StringBuffer(expression);

    buffer.write('.getElement(\'$_name\'');

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

class NullableXmlSerializableXmlElementGetterGenerator
    extends XmlSerializableXmlElementGetterGenerator {
  const NullableXmlSerializableXmlElementGetterGenerator(
    String name, {
    String? namespace,
  }) : super(
          name,
          namespace: namespace,
          isNullable: true,
        );
}

class XmlTextXmlElementGetterGenerator
    extends XmlSerializableXmlElementGetterGenerator {
  const XmlTextXmlElementGetterGenerator(
    String name, {
    String? namespace,
    bool isNullable = false,
  }) : super(
          name,
          namespace: namespace,
          isNullable: isNullable,
        );

  @override
  String generateGetter(String expression) {
    final buffer = StringBuffer(super.generateGetter(expression));

    if (_isNullable) {
      buffer.write('?');
    }

    buffer.write('.getText()');

    if (!_isNullable) {
      buffer.write('!');
    }

    return buffer.toString();
  }
}

class NullableXmlTextXmlElementGetterGenerator
    extends XmlTextXmlElementGetterGenerator {
  const NullableXmlTextXmlElementGetterGenerator(
    String name, {
    String? namespace,
  }) : super(
          name,
          namespace: namespace,
          isNullable: true,
        );
}
