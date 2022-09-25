import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

String constMapName(InterfaceType targetType) =>
    '_\$${targetType.element2.name}EnumMap';

/// If [targetType] is an enum, returns the [FieldElement] instances associated
/// with its values.
///
/// Otherwise, `null`.
Iterable<FieldElement> iterateEnumFields(InterfaceType targetType) {
  if (targetType.element2 is EnumElement) {
    return targetType.element2.fields
        .where((element) => element.isEnumConstant);
  }
  throw TypeError();
}

String enumValueMapFromType(InterfaceType targetType) {
  final enumFields = iterateEnumFields(targetType);

  final enumMap = {
    for (var field in enumFields)
      field: _generateEntry(
        field: field,
        targetType: targetType,
      ),
  };

  final items = enumMap.entries.map((e) {
    return '  ${targetType.element2.name}.${e.key.name}: '
        "'${e.value}',";
  }).join();

  return 'const ${constMapName(targetType)} = {\n$items\n};';
}

String _generateEntry({
  required FieldElement field,
  required DartType targetType,
}) {
  final annotation =
      const TypeChecker.fromRuntime(XmlValue).firstAnnotationOfExact(field);

  if (annotation == null) {
    return field.name;
  } else {
    final reader = ConstantReader(annotation);

    final valueReader = reader.read('value');

    return valueReader.stringValue;
  }
}
