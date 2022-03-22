import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../extensions/dart_object_extensions.dart';
import '../extensions/dart_type_extensions.dart';
import '../extensions/element_extensions.dart';
import '../getter_generators/getter_generator.dart';
import '../getter_generators/xml_attribute_getter_generator.dart';
import '../getter_generators/xml_element_getter_generator.dart';
import '../getter_generators/xml_element_iterable_getter_generator.dart';
import '../getter_generators/xml_text_getter_generator.dart';

/// Creates a [GetterGenerator] from an [Element].
typedef GetterGeneratorFactory = GetterGenerator Function(Element element);

/// Creates a [GetterGenerator] from an [Element] that has an attribute of the form `@XmlAttribute()`, `@XmlElement()`, or `@XmlText()`.
GetterGenerator getterGeneratorFactory(Element element) {
  if (element is VariableElement) {
    if (element.hasXmlAttribute) {
      return xmlAttributeGetterGeneratorFactory(element);
    } else if (element.hasXmlElement) {
      return xmlElementGetterGeneratorFactory(element);
    } else if (element.hasXmlText) {
      return XmlTextGetterGenerator(isNullable: element.type.isNullable);
    }

    throw ArgumentError.value(
      element,
      'element',
      '`${element.name}` does not have a supported annotation. Add an annotation of the form `@XmlAttribute()`, `@XmlElement()`, or `@XmlText()` to `${element.name}`.',
    );
  }

  throw ArgumentError.value(
    element,
    'element',
    '`${element.name}` is not a supported element. Change `${element.name}` to a variable.',
  );
}

/// Creates a [GetterGenerator] from a [VariableElement] that has an attribute of the form `@XmlAttribute()`.
GetterGenerator xmlAttributeGetterGeneratorFactory(VariableElement element) {
  final annotation = element.getXmlAttribute()!;

  final name = annotation.getStringValue('name') ?? element.name;
  final namespace = annotation.getStringValue('namespace');

  return XmlAttributeGetterGenerator(
    name,
    namespace: namespace,
    isNullable: element.type.isNullable,
  );
}

/// Creates a [GetterGenerator] from a [VariableElement] that has an attribute of the form `@XmlElement()`.
GetterGenerator xmlElementGetterGeneratorFactory(VariableElement element) {
  final annotation = element.getXmlElement()!;

  final name = annotation.getStringValue('name') ?? element.name;
  final namespace = annotation.getStringValue('namespace');

  final type = element.type;

  if (type.isDartCoreIterable || type.isDartCoreList || type.isDartCoreSet) {
    final typeArgument = (type as ParameterizedType).typeArguments.single;

    return typeArgument.element!.hasXmlSerializable
        ? XmlSerializableXmlElementIterableGetterGenerator(
            name,
            namespace: namespace,
            isNullable: type.isNullable,
          )
        : XmlTextXmlElementIterableGetterGenerator(
            name,
            namespace: namespace,
            isNullable: type.isNullable,
          );
  } else {
    return type.element!.hasXmlSerializable
        ? XmlSerializableXmlElementGetterGenerator(
            name,
            namespace: namespace,
            isNullable: type.isNullable,
          )
        : XmlTextXmlElementGetterGenerator(
            name,
            namespace: namespace,
            isNullable: type.isNullable,
          );
  }
}
