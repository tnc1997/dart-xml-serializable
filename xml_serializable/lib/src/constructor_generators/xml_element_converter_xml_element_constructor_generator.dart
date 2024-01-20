import 'constructor_generator.dart';

class XmlElementConverterXmlElementConstructorGenerator extends ConstructorGenerator {
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

  /// The name of the converter.
  final String _converter;

  const XmlElementConverterXmlElementConstructorGenerator(
    this._name,
    this._converter, {
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

    buffer.write('), ');

    if (_isNullable && _includeIfNull != false) {
      buffer.write('$expression != null ? ');
    }

    buffer.write(
      'const $_converter().toXmlAttributes($expression, namespaces: namespaces)',
    );

    if (_isNullable && _includeIfNull != false) {
      buffer.write(' : []');
    }

    buffer.write(', ');

    if (_isNullable && _includeIfNull != false) {
      buffer.write('$expression != null ? ');
    }

    buffer.write(
      'const $_converter().toXmlChildren($expression, namespaces: namespaces)',
    );

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

class NullableXmlElementConverterXmlElementConstructorGenerator
    extends XmlElementConverterXmlElementConstructorGenerator {
  const NullableXmlElementConverterXmlElementConstructorGenerator(
    String name,
    String converter, {
    String? namespace,
    bool? isSelfClosing,
    bool? includeIfNull,
  }) : super(
          name,
          converter,
          namespace: namespace,
          isSelfClosing: isSelfClosing,
          includeIfNull: includeIfNull,
          isNullable: true,
        );
}
