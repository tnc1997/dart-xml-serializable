import 'package:source_helper/source_helper.dart';

import 'getter_generator.dart';

abstract class XmlElementIterableGetterGenerator extends GetterGenerator {
  /// The name of the element.
  final String _name;

  /// The namespace of the element.
  final String? _namespace;

  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  const XmlElementIterableGetterGenerator(
    this._name, {
    String? namespace,
    bool isNullable = false,
  })  : _namespace = namespace,
        _isNullable = isNullable;

  @override
  String generateGetter(String expression) {
    final buffer = StringBuffer(expression);

    buffer.write('.getElements(${escapeDartString(_name)}');

    if (_namespace != null) {
      buffer.write(', namespace: ${escapeDartString(_namespace!)}');
    }

    buffer.write(')');

    if (!_isNullable) {
      buffer.write('!');
    }

    return buffer.toString();
  }
}
