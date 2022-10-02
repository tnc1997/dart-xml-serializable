import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

import 'extensions/element_extensions.dart';

class XmlEnumGenerator extends GeneratorForAnnotation<XmlEnum> {
  const XmlEnumGenerator();

  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (!element.library!.isNonNullableByDefault) {
      throw InvalidGenerationSourceError(
        'Generator cannot target libraries that have not been migrated to null-safety.',
        element: element,
      );
    }

    if (element is! EnumElement) {
      throw InvalidGenerationSourceError(
        '`@XmlEnum` can only be used on enums.',
        element: element,
      );
    }

    return _enumValueMapFromType(element.thisType);
  }
}

String? _enumValueMapFromType(DartType targetType) {
  final enumFields = _iterateEnumFields(targetType);

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

  return 'const _\$${targetType.element2!.name!}EnumMap = { ${enumMap.entries.map((e) => '${targetType.element2!.name!}.${e.key.name}: \'${e.value}\'').join(', ')} };';
}

Iterable<FieldElement>? _iterateEnumFields(DartType targetType) {
  final element = targetType.element2;

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
