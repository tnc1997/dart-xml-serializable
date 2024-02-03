import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../builder_generators/builder_generator.dart';
import '../builder_generators/iterable_builder_generator.dart';
import '../builder_generators/xml_attribute_builder_generator.dart';
import '../builder_generators/xml_cdata_builder_generator.dart';
import '../builder_generators/xml_converter_xml_element_builder_generator.dart';
import '../builder_generators/xml_root_element_builder_generator.dart';
import '../builder_generators/xml_serializable_xml_element_builder_generator.dart';
import '../builder_generators/xml_text_builder_generator.dart';
import '../builder_generators/xml_text_xml_element_builder_generator.dart';
import '../extensions/dart_object_extensions.dart';
import '../extensions/dart_type_extensions.dart';
import '../extensions/element_extensions.dart';
import '../extensions/field_element_extensions.dart';

/// Creates a [BuilderGenerator] from an [Element].
typedef BuilderGeneratorFactory = BuilderGenerator Function(Element element);

/// Creates a [BuilderGenerator] from an [Element] that has an annotation of the form `@XmlAttribute()`, `@XmlElement()`, `@XmlRootElement()`, or `@XmlText()`.
BuilderGenerator builderGeneratorFactory(Element element) {
  if (element.hasXmlAttribute) {
    if (element is FieldElement) {
      return xmlAttributeBuilderGeneratorFactory(element);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlAttribute()` can only be used on fields.',
      );
    }
  } else if (element.hasXmlCDATA) {
    if (element is FieldElement) {
      return XmlCDATABuilderGenerator(isNullable: element.type.isNullable);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlCDATA()` can only be used on fields.',
      );
    }
  } else if (element.hasXmlElement) {
    if (element is FieldElement) {
      return xmlElementBuilderGeneratorFactory(element);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlElement()` can only be used on fields.',
      );
    }
  } else if (element.hasXmlRootElement) {
    if (element is ClassElement) {
      return xmlRootElementBuilderGeneratorFactory(element);
    } else {
      throw ArgumentError.value(
        element,
        'element',
        '`@XmlRootElement()` can only be used on classes.',
      );
    }
  } else if (element.hasXmlText) {
    if (element is FieldElement) {
      return XmlTextBuilderGenerator(isNullable: element.type.isNullable);
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

/// Creates a [BuilderGenerator] from a [FieldElement] that has an annotation of the form `@XmlAttribute()`.
BuilderGenerator xmlAttributeBuilderGeneratorFactory(FieldElement element) {
  final xmlAttribute = element.getXmlAttribute()!.toXmlAttributeValue()!;

  return XmlAttributeBuilderGenerator(
    xmlAttribute.name ?? element.getEncodedFieldName(),
    namespace: xmlAttribute.namespace,
    isNullable: element.type.isNullable,
  );
}

/// Creates a [BuilderGenerator] from a [FieldElement] that has an annotation of the form `@XmlElement()`.
BuilderGenerator xmlElementBuilderGeneratorFactory(FieldElement element) {
  final xmlElement = element.getXmlElement()!.toXmlElementValue()!;

  final type = element.type;
  if (type is ParameterizedType &&
      (type.isDartCoreIterable || type.isDartCoreList || type.isDartCoreSet)) {
    final converterElement = element.getXmlConverterElement(type: type);
    if (converterElement != null) {
      return IterableBuilderGenerator(
        XmlConverterXmlElementBuilderGenerator(
          xmlElement.name ?? element.getEncodedFieldName(),
          converterElement.name!,
          namespace: xmlElement.namespace,
          isSelfClosing: xmlElement.isSelfClosing,
          includeIfNull: xmlElement.includeIfNull,
          isNullable: type.typeArguments.single.isNullable,
        ),
        isNullable: type.isNullable,
      );
    } else if (type.typeArguments.single.element!.hasXmlSerializable) {
      return IterableBuilderGenerator(
        XmlSerializableXmlElementBuilderGenerator(
          xmlElement.name ?? element.getEncodedFieldName(),
          namespace: xmlElement.namespace,
          isSelfClosing: xmlElement.isSelfClosing,
          includeIfNull: xmlElement.includeIfNull,
          isNullable: type.typeArguments.single.isNullable,
        ),
        isNullable: type.isNullable,
      );
    } else {
      return IterableBuilderGenerator(
        XmlTextXmlElementBuilderGenerator(
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
    if (converterElement != null) {
      return XmlConverterXmlElementBuilderGenerator(
        xmlElement.name ?? element.getEncodedFieldName(),
        converterElement.name!,
        namespace: xmlElement.namespace,
        isSelfClosing: xmlElement.isSelfClosing,
        includeIfNull: xmlElement.includeIfNull,
        isNullable: type.isNullable,
      );
    } else if (type.element!.hasXmlSerializable) {
      return XmlSerializableXmlElementBuilderGenerator(
        xmlElement.name ?? element.getEncodedFieldName(),
        namespace: xmlElement.namespace,
        isSelfClosing: xmlElement.isSelfClosing,
        includeIfNull: xmlElement.includeIfNull,
        isNullable: type.isNullable,
      );
    } else {
      return XmlTextXmlElementBuilderGenerator(
        xmlElement.name ?? element.getEncodedFieldName(),
        namespace: xmlElement.namespace,
        isSelfClosing: xmlElement.isSelfClosing,
        includeIfNull: xmlElement.includeIfNull,
        isNullable: type.isNullable,
      );
    }
  }
}

/// Creates a [BuilderGenerator] from a [ClassElement] that has an annotation of the form `@XmlRootElement()`.
BuilderGenerator xmlRootElementBuilderGeneratorFactory(ClassElement element) {
  final xmlRootElement = element.getXmlRootElement()!.toXmlRootElementValue()!;

  return XmlRootElementBuilderGenerator(
    xmlRootElement.name ?? element.name,
    namespace: xmlRootElement.namespace,
    isSelfClosing: xmlRootElement.isSelfClosing,
    isNullable: element.thisType.isNullable,
  );
}
