import 'package:source_helper/source_helper.dart';

import 'builder_generator.dart';

class XmlConverterXmlElementBuilderGenerator extends BuilderGenerator {
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

  /// If `false` (the default) then the type of the converter does not represent a nullable type.
  final bool _isConverterNullable;

  const XmlConverterXmlElementBuilderGenerator(
    this._name,
    this._converter, {
    String? namespace,
    bool? isSelfClosing,
    bool? includeIfNull,
    bool isNullable = false,
    bool isConverterNullable = false,
  })  : _namespace = namespace,
        _isSelfClosing = isSelfClosing,
        _includeIfNull = includeIfNull,
        _isNullable = isNullable,
        _isConverterNullable = isConverterNullable;

  @override
  String generateBuilder(String expression, {String builder = 'builder'}) {
    final buffer = StringBuffer();

    if (_isNullable && _includeIfNull == false) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write('$builder.element(${escapeDartString(_name)}');

    if (_namespace != null) {
      buffer.write(', namespace: ${escapeDartString(_namespace!)}');
    }

    if (_isSelfClosing != null) {
      buffer.write(', isSelfClosing: $_isSelfClosing');
    }

    buffer.write(', nest: () { ');

    if (_isNullable && !_isConverterNullable && _includeIfNull != false) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write(
      'const $_converter().buildXmlChildren($expression, $builder, namespaces: namespaces);',
    );

    if (_isNullable && !_isConverterNullable && _includeIfNull != false) {
      buffer.write(' }');
    }

    buffer.write(' });');

    if (_isNullable && _includeIfNull == false) {
      buffer.write(' }');
    }

    return buffer.toString();
  }
}

class NullableXmlConverterXmlElementBuilderGenerator
    extends XmlConverterXmlElementBuilderGenerator {
  const NullableXmlConverterXmlElementBuilderGenerator(
    super.name,
    super.converter, {
    super.namespace,
    super.isSelfClosing,
    super.includeIfNull,
  }) : super(
          isNullable: true,
          isConverterNullable: true,
        );
}
