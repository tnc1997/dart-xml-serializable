import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../constructor_generators/constructor_generator.dart';
import '../constructor_generators/iterable_constructor_generator.dart';
import '../constructor_generators/xml_attribute_constructor_generator.dart';
import '../constructor_generators/xml_root_element_constructor_generator.dart';
import '../constructor_generators/xml_serializable_xml_element_constructor_generator.dart';
import '../constructor_generators/xml_text_constructor_generator.dart';
import '../constructor_generators/xml_text_xml_element_constructor_generator.dart';
import '../extensions/dart_object_extensions.dart';
import '../extensions/dart_type_extensions.dart';
import '../extensions/element_extensions.dart';

/// Creates a [ConstructorGenerator] from an [Element].
typedef ConstructorGeneratorFactory = ConstructorGenerator Function(
  Element element,
);

/// Creates a [ConstructorGenerator] from an [Element] that has an attribute of the form `@XmlAttribute()`, `@XmlElement()`, `@XmlRootElement()`, or `@XmlText()`.
ConstructorGenerator constructorGeneratorFactory(
  Element element,
) {
  if (element is VariableElement) {
    if (element.hasXmlAttribute) {
      return xmlAttributeConstructorGeneratorFactory(element);
    } else if (element.hasXmlElement) {
      return xmlElementConstructorGeneratorFactory(element);
    } else if (element.hasXmlText) {
      return XmlTextConstructorGenerator(isNullable: element.type.isNullable);
    }

    throw ArgumentError.value(
      element,
      'element',
      '`${element.name}` does not have a supported annotation. Add an annotation of the form `@XmlAttribute()`, `@XmlElement()`, or `@XmlText()` to `${element.name}`.',
    );
  } else if (element is ClassElement) {
    if (element.hasXmlRootElement) {
      return xmlRootElementConstructorGeneratorFactory(element);
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

/// Creates a [ConstructorGenerator] from a [VariableElement] that has an attribute of the form `@XmlAttribute()`.
ConstructorGenerator xmlAttributeConstructorGeneratorFactory(
  VariableElement element,
) {
  final annotation = element.getXmlAttribute()!;

  final name = annotation.getStringValue('name') ?? element.name;
  final namespace = annotation.getStringValue('namespace');

  return XmlAttributeConstructorGenerator(
    name,
    namespace: namespace,
    isNullable: element.type.isNullable,
  );
}

/// Creates a [ConstructorGenerator] from a [VariableElement] that has an attribute of the form `@XmlElement()`.
ConstructorGenerator xmlElementConstructorGeneratorFactory(
  VariableElement element,
) {
  final annotation = element.getXmlElement()!;

  final name = annotation.getStringValue('name') ?? element.name;
  final namespace = annotation.getStringValue('namespace');
  final isSelfClosing = annotation.getBoolValue('isSelfClosing');
  final includeIfNull = annotation.getBoolValue('includeIfNull');

  final type = element.type;

  if (type.isDartCoreIterable || type.isDartCoreList || type.isDartCoreSet) {
    final typeArgument = (type as ParameterizedType).typeArguments.single;

    return IterableConstructorGenerator(
      typeArgument.element!.hasXmlSerializable
          ? XmlSerializableXmlElementConstructorGenerator(
              name,
              namespace: namespace,
              isSelfClosing: isSelfClosing,
              includeIfNull: includeIfNull,
              isNullable: typeArgument.isNullable,
            )
          : XmlTextXmlElementConstructorGenerator(
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
        ? XmlSerializableXmlElementConstructorGenerator(
            name,
            namespace: namespace,
            isSelfClosing: isSelfClosing,
            includeIfNull: includeIfNull,
            isNullable: type.isNullable,
          )
        : XmlTextXmlElementConstructorGenerator(
            name,
            namespace: namespace,
            isSelfClosing: isSelfClosing,
            includeIfNull: includeIfNull,
            isNullable: type.isNullable,
          );
  }
}

/// Creates a [ConstructorGenerator] from a [ClassElement] that has an attribute of the form `@XmlRootElement()`.
ConstructorGenerator xmlRootElementConstructorGeneratorFactory(
  ClassElement element,
) {
  final annotation = element.getXmlRootElement()!;

  final name = annotation.getStringValue('name') ?? element.name;
  final namespace = annotation.getStringValue('namespace');
  final isSelfClosing = annotation.getBoolValue('isSelfClosing');

  return XmlRootElementConstructorGenerator(
    name,
    namespace: namespace,
    isSelfClosing: isSelfClosing,
    isNullable: element.thisType.isNullable,
  );
}
