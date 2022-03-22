import 'builder_generator.dart';

class XmlTextXmlElementBuilderGenerator extends BuilderGenerator {
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

  const XmlTextXmlElementBuilderGenerator(
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
  String generateBuilder(String expression, {String builder = 'builder'}) {
    final buffer = StringBuffer();

    if (_isNullable && _includeIfNull == false) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write('$builder.element(\'$_name\'');

    if (_namespace != null) {
      buffer.write(', namespace: \'$_namespace\'');
    }

    if (_isSelfClosing != null) {
      buffer.write(', isSelfClosing: $_isSelfClosing');
    }

    buffer.write(', nest: () { ');

    if (_isNullable && _includeIfNull != false) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write('$builder.text($expression);');

    if (_isNullable && _includeIfNull != false) {
      buffer.write(' }');
    }

    buffer.write(' });');

    if (_isNullable && _includeIfNull == false) {
      buffer.write(' }');
    }

    return buffer.toString();
  }
}

class NullableXmlTextXmlElementBuilderGenerator
    extends XmlTextXmlElementBuilderGenerator {
  const NullableXmlTextXmlElementBuilderGenerator(
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
