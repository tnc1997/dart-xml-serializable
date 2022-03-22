import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../builder_generators/builder_generator.dart';
import '../builder_generators/iterable_builder_generator.dart';
import '../builder_generators/xml_attribute_builder_generator.dart';
import '../builder_generators/xml_root_element_builder_generator.dart';
import '../builder_generators/xml_serializable_xml_element_builder_generator.dart';
import '../builder_generators/xml_text_builder_generator.dart';
import '../builder_generators/xml_text_xml_element_builder_generator.dart';
import '../extensions/dart_object_extensions.dart';
import '../extensions/dart_type_extensions.dart';
import '../extensions/element_extensions.dart';

/// Creates a [BuilderGenerator] from an [Element].
typedef BuilderGeneratorFactory = BuilderGenerator Function(Element element);

/// Creates a [BuilderGenerator] from an [Element] that has an attribute of the form `@XmlAttribute()`, `@XmlElement()`, `@XmlRootElement()`, or `@XmlText()`.
BuilderGenerator builderGeneratorFactory(Element element) {
  if (element is VariableElement) {
    if (element.hasXmlAttribute) {
      return xmlAttributeBuilderGeneratorFactory(element);
    } else if (element.hasXmlElement) {
      return xmlElementBuilderGeneratorFactory(element);
    } else if (element.hasXmlText) {
      return XmlTextBuilderGenerator(isNullable: element.type.isNullable);
    }

    throw ArgumentError.value(
      element,
      'element',
      '`${element.name}` does not have a supported annotation. Add an annotation of the form `@XmlAttribute()`, `@XmlElement()`, or `@XmlText()` to `${element.name}`.',
    );
  } else if (element is ClassElement) {
    if (element.hasXmlRootElement) {
      return xmlRootElementBuilderGeneratorFactory(element);
    }

    throw ArgumentError.value(
      element,
      'element',
      '`${element.name}` does not have a supported annotation. Add an annotation of the form `@XmlRootElement()` to `${element.name}`.',
    );
  }

  throw ArgumentError.value(
    element,
    'element',
    '`${element.name}` is not a supported element. Change `${element.name}` to a class or a variable.',
  );
}

/// Creates a [BuilderGenerator] from a [VariableElement] that has an attribute of the form `@XmlAttribute()`.
BuilderGenerator xmlAttributeBuilderGeneratorFactory(VariableElement element) {
  final annotation = element.getXmlAttribute()!;

  final name = annotation.getStringValue('name') ?? element.name;
  final namespace = annotation.getStringValue('namespace');

  return XmlAttributeBuilderGenerator(
    name,
    namespace: namespace,
    isNullable: element.type.isNullable,
  );
}

/// Creates a [BuilderGenerator] from a [VariableElement] that has an attribute of the form `@XmlElement()`.
BuilderGenerator xmlElementBuilderGeneratorFactory(VariableElement element) {
  final annotation = element.getXmlElement()!;

  final name = annotation.getStringValue('name') ?? element.name;
  final namespace = annotation.getStringValue('namespace');
  final isSelfClosing = annotation.getBoolValue('isSelfClosing');
  final includeIfNull = annotation.getBoolValue('includeIfNull');

  final type = element.type;

  if (type.isDartCoreIterable || type.isDartCoreList || type.isDartCoreSet) {
    final typeArgument = (type as ParameterizedType).typeArguments.single;

    return IterableBuilderGenerator(
      typeArgument.element!.hasXmlSerializable
          ? XmlSerializableXmlElementBuilderGenerator(
              name,
              namespace: namespace,
              isSelfClosing: isSelfClosing,
              includeIfNull: includeIfNull,
              isNullable: typeArgument.isNullable,
            )
          : XmlTextXmlElementBuilderGenerator(
              name,
              namespace: namespace,
              isSelfClosing: isSelfClosing,
              includeIfNull: includeIfNull,
              isNullable: typeArgument.isNullable,
            ),
      isNullable: type.isNullable,
    );
  } else {
    return type.element!.hasXmlSerializable
        ? XmlSerializableXmlElementBuilderGenerator(
            name,
            namespace: namespace,
            isSelfClosing: isSelfClosing,
            includeIfNull: includeIfNull,
            isNullable: type.isNullable,
          )
        : XmlTextXmlElementBuilderGenerator(
            name,
            namespace: namespace,
            isSelfClosing: isSelfClosing,
            includeIfNull: includeIfNull,
            isNullable: type.isNullable,
          );
  }
}

/// Creates a [BuilderGenerator] from a [ClassElement] that has an attribute of the form `@XmlRootElement()`.
BuilderGenerator xmlRootElementBuilderGeneratorFactory(ClassElement element) {
  final annotation = element.getXmlRootElement()!;

  final name = annotation.getStringValue('name') ?? element.name;
  final namespace = annotation.getStringValue('namespace');
  final isSelfClosing = annotation.getBoolValue('isSelfClosing');

  return XmlRootElementBuilderGenerator(
    name,
    namespace: namespace,
    isSelfClosing: isSelfClosing,
    isNullable: element.thisType.isNullable,
  );
}
