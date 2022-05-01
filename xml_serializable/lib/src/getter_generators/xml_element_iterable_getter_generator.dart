import 'getter_generator.dart';

class XmlSerializableXmlElementIterableGetterGenerator extends GetterGenerator {
  /// The name of the element.
  final String _name;

  /// The namespace of the element.
  final String? _namespace;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlSerializableXmlElementIterableGetterGenerator(
    this._name, {
    String? namespace,
    bool isNullable = false,
  })  : _namespace = namespace,
        _isNullable = isNullable;

  @override
  String generateGetter(String expression) {
    final buffer = StringBuffer(expression);

    buffer.write('.getElements(\'$_name\'');

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

class NullableXmlSerializableXmlElementIterableGetterGenerator
    extends XmlSerializableXmlElementIterableGetterGenerator {
  const NullableXmlSerializableXmlElementIterableGetterGenerator(
    String name, {
    String? namespace,
  }) : super(
          name,
          namespace: namespace,
          isNullable: true,
        );
}

class XmlTextXmlElementIterableGetterGenerator
    extends XmlSerializableXmlElementIterableGetterGenerator {
  const XmlTextXmlElementIterableGetterGenerator(
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

    buffer.write('.map((e) => e.getText()).whereType<String>()');

    return buffer.toString();
  }
}

class NullableXmlTextXmlElementIterableGetterGenerator
    extends XmlTextXmlElementIterableGetterGenerator {
  const NullableXmlTextXmlElementIterableGetterGenerator(
    String name, {
    String? namespace,
  }) : super(
          name,
          namespace: namespace,
          isNullable: true,
        );
}
