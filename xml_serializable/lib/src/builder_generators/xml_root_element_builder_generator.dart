import 'package:source_helper/source_helper.dart';

import 'builder_generator.dart';

class XmlRootElementBuilderGenerator extends BuilderGenerator {
  /// The name of the element.
  final String _name;

  /// The namespace of the element.
  final String? _namespace;

  /// If `true` (the default) then the element will be self-closed if it is empty.
  final bool? _isSelfClosing;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlRootElementBuilderGenerator(
    this._name, {
    String? namespace,
    bool? isSelfClosing,
    bool isNullable = false,
  })  : _namespace = namespace,
        _isSelfClosing = isSelfClosing,
        _isNullable = isNullable;

  @override
  String generateBuilder(String expression, {String builder = 'builder'}) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('if ($expression != null) { ');
    }

    buffer.write('$builder.element(${escapeDartString(_name)}');

    if (_namespace != null) {
      buffer.write(', namespace: ${escapeDartString(_namespace!)}');
    }

    buffer.write(', namespaces: namespaces');

    if (_isSelfClosing != null) {
      buffer.write(', isSelfClosing: $_isSelfClosing');
    }

    buffer.write(', nest: () { ');

    buffer.write(
      '$expression.buildXmlChildren($builder, namespaces: namespaces);',
    );

    buffer.write(' });');

    if (_isNullable) {
      buffer.write(' }');
    }

    return buffer.toString();
  }
}

class NullableXmlRootElementBuilderGenerator
    extends XmlRootElementBuilderGenerator {
  const NullableXmlRootElementBuilderGenerator(
    super.name, {
    super.namespace,
    super.isSelfClosing,
  }) : super(
          isNullable: true,
        );
}
