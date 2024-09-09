import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../constructor_generators/constructor_generator.dart';
import '../constructor_generators/iterable_constructor_generator.dart';
import '../constructor_generators/xml_attribute_constructor_generator.dart';
import '../constructor_generators/xml_cdata_constructor_generator.dart';
import '../constructor_generators/xml_converter_xml_element_constructor_generator.dart';
import '../constructor_generators/xml_root_element_constructor_generator.dart';
import '../constructor_generators/xml_serializable_xml_element_constructor_generator.dart';
import '../constructor_generators/xml_text_constructor_generator.dart';
import '../constructor_generators/xml_text_xml_element_constructor_generator.dart';
import '../extensions/dart_object_extensions.dart';
import '../extensions/dart_type_extensions.dart';
import '../extensions/element_extensions.dart';
import '../extensions/field_element_extensions.dart';

/// Creates a [ConstructorGenerator] from an [Element].
typedef ConstructorGeneratorFactory = ConstructorGenerator Function(
  Element element,
);

/// Creates a [ConstructorGenerator] from an [Element] that has an attribute of the form `@XmlAttribute()`, `@XmlElement()`, `@XmlRootElement()`, or `@XmlText()`.
ConstructorGenerator constructorGeneratorFactory(Element element) {
  if (element.hasXmlAttribute) {
    if (element is FieldElement) {
      return xmlAttributeConstructorGeneratorFactory(element);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlAttribute()` can only be used on fields.',
      );
    }
  } else if (element.hasXmlCDATA) {
    if (element is FieldElement) {
      return XmlCDATAConstructorGenerator(isNullable: element.type.isNullable);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlCDATA()` can only be used on fields.',
      );
    }
  } else if (element.hasXmlElement) {
    if (element is FieldElement) {
      return xmlElementConstructorGeneratorFactory(element);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlElement()` can only be used on fields.',
      );
    }
  } else if (element.hasXmlRootElement) {
    if (element is ClassElement) {
      return xmlRootElementConstructorGeneratorFactory(element);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlRootElement()` can only be used on classes.',
      );
    }
  } else if (element.hasXmlText) {
    if (element is FieldElement) {
      return XmlTextConstructorGenerator(isNullable: element.type.isNullable);
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
    '`${element.name}` does not have a supported annotation. Add an annotation of the form `@XmlAttribute()`, `@XmlElement()`, `@XmlRootElement()`, or `@XmlText()` to `${element.name}`.',
  );
}

/// Creates a [ConstructorGenerator] from a [FieldElement] that has an attribute of the form `@XmlAttribute()`.
ConstructorGenerator xmlAttributeConstructorGeneratorFactory(
  FieldElement element,
) {
  final xmlAttribute = element.getXmlAttribute()!.toXmlAttributeValue()!;

  return XmlAttributeConstructorGenerator(
    xmlAttribute.name ?? element.getEncodedFieldName(),
    namespace: xmlAttribute.namespace,
    isNullable: element.type.isNullable,
  );
}

/// Creates a [ConstructorGenerator] from a [FieldElement] that has an attribute of the form `@XmlElement()`.
ConstructorGenerator xmlElementConstructorGeneratorFactory(
  FieldElement element,
) {
  final xmlElement = element.getXmlElement()!.toXmlElementValue()!;

  final type = element.type;
  if (type is ParameterizedType &&
      (type.isDartCoreIterable || type.isDartCoreList || type.isDartCoreSet)) {
    final converterElement = element.getXmlConverterElement(type: type);
    if (converterElement is ClassElement) {
      return IterableConstructorGenerator(
        XmlConverterXmlElementConstructorGenerator(
          xmlElement.name ?? element.getEncodedFieldName(),
          converterElement.name,
          namespace: xmlElement.namespace,
          isSelfClosing: xmlElement.isSelfClosing,
          includeIfNull: xmlElement.includeIfNull,
          isNullable: type.typeArguments.single.isNullable,
          isConverterNullable: converterElement.thisType.allSupertypes.any(
            (supertype) =>
                supertype.element.library.identifier ==
                    'package:xml_annotation/src/annotations/xml_converter.dart' &&
                supertype.element.name == 'XmlConverter' &&
                supertype.typeArguments.single.isNullable,
          ),
        ),
        isNullable: type.isNullable,
      );
    } else if (type.typeArguments.single.element!.hasXmlSerializable) {
      return IterableConstructorGenerator(
        XmlSerializableXmlElementConstructorGenerator(
          xmlElement.name ?? element.getEncodedFieldName(),
          namespace: xmlElement.namespace,
          isSelfClosing: xmlElement.isSelfClosing,
          includeIfNull: xmlElement.includeIfNull,
          isNullable: type.typeArguments.single.isNullable,
        ),
        isNullable: type.isNullable,
      );
    } else {
      return IterableConstructorGenerator(
        XmlTextXmlElementConstructorGenerator(
          xmlElement.name ?? element.getEncodedFieldName(),
          namespace: xmlElement.namespace,
          isSelfClosing: xmlElement.isSelfClosing,
          includeIfNull: xmlElement.includeIfNull,
          isNullable: type.typeArguments.single.isNullable,
        ),
        isNullable: type.isNullable,
      );
    }
  } else {
    final converterElement = element.getXmlConverterElement(type: type);
    if (converterElement is ClassElement) {
      return XmlConverterXmlElementConstructorGenerator(
        xmlElement.name ?? element.getEncodedFieldName(),
        converterElement.name,
        namespace: xmlElement.namespace,
        isSelfClosing: xmlElement.isSelfClosing,
        includeIfNull: xmlElement.includeIfNull,
        isNullable: type.isNullable,
        isConverterNullable: converterElement.thisType.allSupertypes.any(
          (supertype) =>
              supertype.element.library.identifier ==
                  'package:xml_annotation/src/annotations/xml_converter.dart' &&
              supertype.element.name == 'XmlConverter' &&
              supertype.typeArguments.single.isNullable,
        ),
      );
    } else if (type.element!.hasXmlSerializable) {
      return XmlSerializableXmlElementConstructorGenerator(
        xmlElement.name ?? element.getEncodedFieldName(),
        namespace: xmlElement.namespace,
        isSelfClosing: xmlElement.isSelfClosing,
        includeIfNull: xmlElement.includeIfNull,
        isNullable: type.isNullable,
      );
    } else {
      return XmlTextXmlElementConstructorGenerator(
        xmlElement.name ?? element.getEncodedFieldName(),
        namespace: xmlElement.namespace,
        isSelfClosing: xmlElement.isSelfClosing,
        includeIfNull: xmlElement.includeIfNull,
        isNullable: type.isNullable,
      );
    }
  }
}

/// Creates a [ConstructorGenerator] from a [ClassElement] that has an attribute of the form `@XmlRootElement()`.
ConstructorGenerator xmlRootElementConstructorGeneratorFactory(
  ClassElement element,
) {
  final xmlRootElement = element.getXmlRootElement()!.toXmlRootElementValue()!;

  return XmlRootElementConstructorGenerator(
    xmlRootElement.name ?? element.name,
    namespace: xmlRootElement.namespace,
    isSelfClosing: xmlRootElement.isSelfClosing,
    isNullable: element.thisType.isNullable,
  );
}
