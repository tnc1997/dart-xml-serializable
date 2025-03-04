import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

import 'extensions/dart_object_extensions.dart';
import 'extensions/element_extensions.dart';
import 'extensions/field_element_extensions.dart';

class XmlEnumGenerator extends GeneratorForAnnotation<XmlEnum> {
  const XmlEnumGenerator();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError(
        '`@XmlEnum` can only be used on enums.',
        element: element,
      );
    }

    return 'const \$${element.name}EnumMap = { ${element.fields.where((e) => e.isEnumConstant).map((e) => '${element.name}.${e.name}: \'${e.hasXmlValue ? e.getXmlValue()!.toXmlValueValue()!.value : e.getEncodedFieldName()}\'').join(', ')} };';
  }
}
