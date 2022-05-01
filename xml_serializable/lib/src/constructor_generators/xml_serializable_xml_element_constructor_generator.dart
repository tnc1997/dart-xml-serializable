import 'constructor_generator.dart';

class XmlSerializableXmlElementConstructorGenerator
    extends ConstructorGenerator {
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

  const XmlSerializableXmlElementConstructorGenerator(
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

    buffer.write('XmlElement(XmlName(\'$_name\'');

    if (_namespace != null) {
      buffer.write(', namespaces[\'$_namespace\']');
    }

    buffer.write('), $expression');

    if (_isNullable && _includeIfNull != false) {
      buffer.write('?');
    }

    buffer.write('.toXmlAttributes(namespaces: namespaces)');

    if (_isNullable && _includeIfNull != false) {
      buffer.write(' ?? []');
    }

    buffer.write(', $expression');

    if (_isNullable && _includeIfNull != false) {
      buffer.write('?');
    }

    buffer.write('.toXmlChildren(namespaces: namespaces)');

    if (_isNullable && _includeIfNull != false) {
      buffer.write(' ?? []');
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

class NullableXmlSerializableXmlElementConstructorGenerator
    extends XmlSerializableXmlElementConstructorGenerator {
  const NullableXmlSerializableXmlElementConstructorGenerator(
    String name, {
    String? namespace,
    bool? isSelfClosing,
    bool? includeIfNull,
  }) : super(
          name,
          namespace: namespace,
          isSelfClosing: isSelfClosing,
          includeIfNull: includeIfNull,
          isNullable: true,
        );
}
