import 'package:source_helper/source_helper.dart';

import 'constructor_generator.dart';

class XmlRootElementConstructorGenerator extends ConstructorGenerator {
  /// The name of the element.
  final String _name;

  /// The namespace of the element.
  final String? _namespace;

  /// If `true` (the default) then the element will be self-closed if it is empty.
  final bool? _isSelfClosing;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlRootElementConstructorGenerator(
    this._name, {
    String? namespace,
    bool? isSelfClosing,
    bool isNullable = false,
  })  : _namespace = namespace,
        _isSelfClosing = isSelfClosing,
        _isNullable = isNullable;

  @override
  String generateConstructor(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('XmlElement(XmlName(${escapeDartString(_name)}');

    if (_namespace != null) {
      buffer.write(', namespaces[${escapeDartString(_namespace!)}]');
    }

    buffer.write(
      '), [...namespaces.toXmlAttributes(), ...$expression.toXmlAttributes(namespaces: namespaces)], $expression.toXmlChildren(namespaces: namespaces)',
    );

    if (_isSelfClosing != null) {
      buffer.write(', $_isSelfClosing');
    }

    buffer.write(')');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableXmlRootElementConstructorGenerator
    extends XmlRootElementConstructorGenerator {
  const NullableXmlRootElementConstructorGenerator(
    super.name, {
    super.namespace,
    super.isSelfClosing,
  }) : super(
          isNullable: true,
        );
}
