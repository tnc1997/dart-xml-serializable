import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'extensions/element_extensions.dart';

String constMapName(DartType targetType) =>
    '_\$${targetType.element!.name!}EnumMap';

String? enumValueMapFromType(DartType targetType) {
  final enumFields = iterateEnumFields(targetType);

  if (enumFields == null) {
    return null;
  }

  final enumMap = {
    for (var field in enumFields)
      field: _generateEntry(
        field: field,
        targetType: targetType,
      ),
  };

  final items = enumMap.entries.map((e) {
    return '  ${targetType.element!.name!}.${e.key.name}: '
        "'${e.value}',";
  }).join();

  return 'const ${constMapName(targetType)} = {\n$items\n};';
}

Iterable<FieldElement>? iterateEnumFields(DartType targetType) {
  final element = targetType.element;

  return element is EnumElement
      ? element.fields.where((e) => e.isEnumConstant)
      : null;
}

dynamic _generateEntry({
  required FieldElement field,
  required DartType targetType,
}) {
  final annotation = field.hasXmlValue ? field.getXmlValue() : null;

  final value = annotation?.getField('value');

  return value == null
      ? field.name
      : value.type!.isDartCoreString
          ? value.toStringValue()
          : value.type!.isDartCoreInt
              ? value.toIntValue()
              : throw ArgumentError.value(
                  field,
                  'field',
                  'The value `$value` is not a `String` nor an `int`.',
                );
}
