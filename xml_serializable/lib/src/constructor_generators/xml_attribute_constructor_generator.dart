import 'package:source_helper/source_helper.dart';

import 'constructor_generator.dart';

class XmlAttributeConstructorGenerator extends ConstructorGenerator {
  /// The name of the attribute.
  final String _name;

  /// The namespace of the attribute.
  final String? _namespace;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlAttributeConstructorGenerator(
    this._name, {
    String? namespace,
    bool isNullable = false,
  })  : _namespace = namespace,
        _isNullable = isNullable;

  @override
  String generateConstructor(String expression) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('XmlAttribute(XmlName(${escapeDartString(_name)}');

    if (_namespace != null) {
      buffer.write(', namespaces[${escapeDartString(_namespace!)}]');
    }

    buffer.write('), $expression)');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableXmlAttributeConstructorGenerator
    extends XmlAttributeConstructorGenerator {
  const NullableXmlAttributeConstructorGenerator(
    super.name, {
    super.namespace,
  }) : super(isNullable: true);
}
