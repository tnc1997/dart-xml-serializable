import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../extensions/dart_object_extensions.dart';
import '../extensions/dart_type_extensions.dart';
import '../extensions/element_extensions.dart';
import '../extensions/field_element_extensions.dart';
import '../getter_generators/getter_generator.dart';
import '../getter_generators/xml_attribute_getter_generator.dart';
import '../getter_generators/xml_cdata_getter_generator.dart';
import '../getter_generators/xml_element_getter_generator.dart';
import '../getter_generators/xml_element_iterable_getter_generator.dart';
import '../getter_generators/xml_text_getter_generator.dart';

/// Creates a [GetterGenerator] from an [Element].
typedef GetterGeneratorFactory = GetterGenerator Function(Element element);

/// Creates a [GetterGenerator] from an [Element] that has an attribute of the form `@XmlAttribute()`, `@XmlElement()`, or `@XmlText()`.
GetterGenerator getterGeneratorFactory(Element element) {
  if (element.hasXmlAttribute) {
    if (element is FieldElement) {
      return xmlAttributeGetterGeneratorFactory(element);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlAttribute()` can only be used on fields.',
      );
    }
  } else if (element.hasXmlCDATA) {
    if (element is FieldElement) {
      return XmlCDATAGetterGenerator(isNullable: element.type.isNullable);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlCDATA()` can only be used on fields.',
      );
    }
  } else if (element.hasXmlElement) {
    if (element is FieldElement) {
      return xmlElementGetterGeneratorFactory(element);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlElement()` can only be used on fields.',
      );
    }
  } else if (element.hasXmlText) {
    if (element is FieldElement) {
      return XmlTextGetterGenerator(isNullable: element.type.isNullable);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlText()` can only be used on fields.',
      );
    }
  }

  throw ArgumentError.value(
    element,
    'element',
    '`${element.name}` does not have a supported annotation. Add an annotation of the form `@XmlAttribute()`, `@XmlElement()`, or `@XmlText()` to `${element.name}`.',
  );
}

/// Creates a [GetterGenerator] from a [FieldElement] that has an attribute of the form `@XmlAttribute()`.
GetterGenerator xmlAttributeGetterGeneratorFactory(FieldElement element) {
  final xmlAttribute = element.getXmlAttribute()!.toXmlAttributeValue()!;

  return XmlAttributeGetterGenerator(
    xmlAttribute.name ?? element.getEncodedFieldName(),
    namespace: xmlAttribute.namespace,
    isNullable: element.type.isNullable,
  );
}

/// Creates a [GetterGenerator] from a [FieldElement] that has an attribute of the form `@XmlElement()`.
GetterGenerator xmlElementGetterGeneratorFactory(FieldElement element) {
  final xmlElement = element.getXmlElement()!.toXmlElementValue()!;

  final type = element.type;

  if (type.isDartCoreIterable || type.isDartCoreList || type.isDartCoreSet) {
    final typeArgument = (type as ParameterizedType).typeArguments.single;

    return typeArgument.element!.hasXmlSerializable
        ? XmlSerializableXmlElementIterableGetterGenerator(
            xmlElement.name ?? element.getEncodedFieldName(),
            namespace: xmlElement.namespace,
            isNullable: type.isNullable,
          )
        : XmlTextXmlElementIterableGetterGenerator(
            xmlElement.name ?? element.getEncodedFieldName(),
            namespace: xmlElement.namespace,
            isNullable: type.isNullable,
          );
  } else {
    return type.element!.hasXmlSerializable
        ? XmlSerializableXmlElementGetterGenerator(
            xmlElement.name ?? element.getEncodedFieldName(),
            namespace: xmlElement.namespace,
            isNullable: type.isNullable,
          )
        : XmlTextXmlElementGetterGenerator(
            xmlElement.name ?? element.getEncodedFieldName(),
            namespace: xmlElement.namespace,
            isNullable: type.isNullable,
          );
  }
}
