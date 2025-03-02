import 'package:source_helper/source_helper.dart';

import 'constructor_generator.dart';

class XmlTextXmlElementConstructorGenerator extends ConstructorGenerator {
  /// The name of the element.
  final String _name;

  /// The namespace of the element.
  final String? _namespace;

  /// If `true` (the default) then the element will be self-closed if it is empty.
  final bool? _isSelfClosing;

  /// If `true` (the default) then the element will be serialized even if it is `null`.
  final bool? _includeIfNull;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlTextXmlElementConstructorGenerator(
    this._name, {
    String? namespace,
    bool? isSelfClosing,
    bool? includeIfNull,
    bool isNullable = false,
  })  : _namespace = namespace,
        _isSelfClosing = isSelfClosing,
        _includeIfNull = includeIfNull,
        _isNullable = isNullable;

  @override
  String generateConstructor(String expression) {
    final buffer = StringBuffer();

    if (_isNullable && _includeIfNull == false) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('XmlElement(XmlName(${escapeDartString(_name)}');

    if (_namespace != null) {
      buffer.write(', namespaces[${escapeDartString(_namespace!)}]');
    }

    buffer.write('), [], ');

    if (_isNullable && _includeIfNull != false) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('[XmlText($expression)]');

    if (_isNullable && _includeIfNull != false) {
      buffer.write(' : []');
    }

    if (_isSelfClosing != null) {
      buffer.write(', $_isSelfClosing');
    }

    buffer.write(')');

    if (_isNullable && _includeIfNull == false) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}

class NullableXmlTextXmlElementConstructorGenerator
    extends XmlTextXmlElementConstructorGenerator {
  const NullableXmlTextXmlElementConstructorGenerator(
    super.name, {
    super.namespace,
    super.isSelfClosing,
    super.includeIfNull,
  }) : super(
          isNullable: true,
        );
}
