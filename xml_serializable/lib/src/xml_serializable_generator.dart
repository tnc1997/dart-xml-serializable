import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

import 'extensions/class_element_extensions.dart';
import 'extensions/dart_object_extensions.dart';
import 'extensions/dart_type_extensions.dart';
import 'extensions/element_extensions.dart';
import 'generator_factories/builder_generator_factory.dart';
import 'generator_factories/constructor_generator_factory.dart';
import 'generator_factories/getter_generator_factory.dart';
import 'generator_factories/serializer_generator_factory.dart';
import 'serializer_generators/iterable_serializer_generator.dart';
import 'serializer_generators/serializer_generator.dart';
import 'serializer_generators/xml_converter_xml_element_serializer_generator.dart';
import 'serializer_generators/xml_serializable_xml_element_serializer_generator.dart';

class XmlSerializableGenerator extends GeneratorForAnnotation<XmlSerializable> {
  final BuilderGeneratorFactory _builderGeneratorFactory;

  final ConstructorGeneratorFactory _constructorGeneratorFactory;

  final GetterGeneratorFactory _getterGeneratorFactory;

  final SerializerGeneratorFactory _serializerGeneratorFactory;

  const XmlSerializableGenerator({
    BuilderGeneratorFactory builderGeneratorFactory = builderGeneratorFactory,
    ConstructorGeneratorFactory constructorGeneratorFactory =
        constructorGeneratorFactory,
    GetterGeneratorFactory getterGeneratorFactory = getterGeneratorFactory,
    SerializerGeneratorFactory serializerGeneratorFactory =
        serializerGeneratorFactory,
  })  : _builderGeneratorFactory = builderGeneratorFactory,
        _constructorGeneratorFactory = constructorGeneratorFactory,
        _getterGeneratorFactory = getterGeneratorFactory,
        _serializerGeneratorFactory = serializerGeneratorFactory;

  @override
  String generateForAnnotatedElement(
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

    if (element is ClassElement) {
      final xmlSerializable =
          element.getXmlSerializable()!.toXmlSerializableValue()!;

      final buffer = StringBuffer();

      _generateBuildXmlChildren(buffer, element);

      if (element.hasXmlRootElement) {
        buffer.writeln();
        buffer.writeln();

        _generateBuildXmlElement(buffer, element);
      }

      buffer.writeln();
      buffer.writeln();

      _generateFromXmlElement(buffer, element);

      buffer.writeln();
      buffer.writeln();

      _generateToXmlAttributes(buffer, element);

      buffer.writeln();
      buffer.writeln();

      _generateToXmlChildren(buffer, element);

      if (element.hasXmlRootElement) {
        buffer.writeln();
        buffer.writeln();

        _generateToXmlElement(buffer, element);
      }

      if (xmlSerializable.createMixin == true) {
        buffer.writeln();
        buffer.writeln();

        _generateMixin(buffer, element);
      }

      return buffer.toString();
    } else {
      throw InvalidGenerationSourceError(
        '`@XmlSerializable()` can only be used on classes.',
        element: element,
      );
    }
  }

  bool _doesRequireNullCheck(FieldElement element) => element.hasXmlElement
      ? element.type.isNullable &&
          (element.getXmlElement()?.toXmlElementValue()?.includeIfNull ==
                  false ||
              element.type.isDartCoreIterable ||
              element.type.isDartCoreList ||
              element.type.isDartCoreSet)
      : element.type.isNullable;

  void _generateBuildXmlChildren(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      'void _\$${element.name}BuildXmlChildren(${element.name} instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {',
    );

    for (final element in element.allFields) {
      if (element.hasXmlAttribute ||
          element.hasXmlCDATA ||
          element.hasXmlElement ||
          element.hasXmlText) {
        buffer.writeln(
          'final ${element.name} = instance.${element.name};',
        );

        buffer.writeln(
          'final ${element.name}Serialized = ${_xmlSerializableSerializerGeneratorFactory(element).generateSerializer(element.name)};',
        );

        buffer.writeln(
          _builderGeneratorFactory(element).generateBuilder(
            '${element.name}Serialized',
          ),
        );
      }
    }

    buffer.write('}');
  }

  void _generateBuildXmlElement(StringBuffer buffer, ClassElement element) {
    buffer.write(
      'void _\$${element.name}BuildXmlElement(${element.name} instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {\n${_builderGeneratorFactory(element).generateBuilder('instance')}\n}',
    );
  }

  void _generateFromXmlElement(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      '${element.name} _\$${element.name}FromXmlElement(XmlElement element) {',
    );

    final elements = <FieldElement>{};

    for (final element in element.allFields) {
      if (element.hasXmlAttribute ||
          element.hasXmlCDATA ||
          element.hasXmlElement ||
          element.hasXmlText) {
        buffer.writeln(
          'final ${element.name} = ${_getterGeneratorFactory(element).generateGetter('element')};',
        );

        elements.add(element);
      }
    }

    buffer.writeln(
      'return ${element.name}(${elements.map((element) => '${element.name}: ${_xmlSerializableSerializerGeneratorFactory(element).generateDeserializer(element.name)}').join(', ')});',
    );

    buffer.write('}');
  }

  void _generateMixin(StringBuffer buffer, ClassElement element) {
    buffer.writeln('mixin _\$${element.name}XmlSerializableMixin {');

    buffer.writeln(
      'void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) => _\$${element.name}BuildXmlChildren(this as ${element.name}, builder, namespaces: namespaces);',
    );

    if (element.hasXmlRootElement) {
      buffer.writeln();

      buffer.writeln(
        'void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) => _\$${element.name}BuildXmlElement(this as ${element.name}, builder, namespaces: namespaces);',
      );
    }

    buffer.writeln();

    buffer.writeln(
      'List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) => _\$${element.name}ToXmlAttributes(this as ${element.name}, namespaces: namespaces);',
    );

    buffer.writeln();

    buffer.writeln(
      'List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) => _\$${element.name}ToXmlChildren(this as ${element.name}, namespaces: namespaces);',
    );

    if (element.hasXmlRootElement) {
      buffer.writeln();

      buffer.writeln(
        'XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) => _\$${element.name}ToXmlElement(this as ${element.name}, namespaces: namespaces);',
      );
    }

    buffer.write('}');
  }

  void _generateToXmlAttributes(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      'List<XmlAttribute> _\$${element.name}ToXmlAttributes(${element.name} instance, {Map<String, String?> namespaces = const {}}) {',
    );

    buffer.writeln('final attributes = <XmlAttribute>[];');

    for (final element in element.allFields) {
      if (element.hasXmlAttribute) {
        buffer.writeln('final ${element.name} = instance.${element.name};');

        buffer.writeln(
          'final ${element.name}Serialized = ${_xmlSerializableSerializerGeneratorFactory(element).generateSerializer(element.name)};',
        );

        buffer.writeln(
          'final ${element.name}Constructed = ${_constructorGeneratorFactory(element).generateConstructor('${element.name}Serialized')};',
        );

        if (_doesRequireNullCheck(element)) {
          buffer.write('if (${element.name}Constructed != null) { ');
        }

        if (element.type.isDartCoreIterable ||
            element.type.isDartCoreList ||
            element.type.isDartCoreSet) {
          throw InvalidGenerationSourceError(
            '`@XmlAttribute()` cannot be used on fields of an iterable type due to https://www.w3.org/TR/xml/#uniqattspec.',
            element: element,
          );
        } else {
          buffer.write('attributes.add(${element.name}Constructed);');
        }

        if (_doesRequireNullCheck(element)) {
          buffer.write(' }');
        }

        buffer.writeln();
      }
    }

    buffer.writeln('return attributes;');

    buffer.write('}');
  }

  void _generateToXmlChildren(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      'List<XmlNode> _\$${element.name}ToXmlChildren(${element.name} instance, {Map<String, String?> namespaces = const {}}) {',
    );

    buffer.writeln('final children = <XmlNode>[];');

    for (final element in element.allFields) {
      if (element.hasXmlCDATA || element.hasXmlElement || element.hasXmlText) {
        buffer.writeln('final ${element.name} = instance.${element.name};');

        buffer.writeln(
          'final ${element.name}Serialized = ${_xmlSerializableSerializerGeneratorFactory(element).generateSerializer(element.name)};',
        );

        buffer.writeln(
          'final ${element.name}Constructed = ${_constructorGeneratorFactory(element).generateConstructor('${element.name}Serialized')};',
        );

        if (_doesRequireNullCheck(element)) {
          buffer.write('if (${element.name}Constructed != null) { ');
        }

        if (element.type.isDartCoreIterable ||
            element.type.isDartCoreList ||
            element.type.isDartCoreSet) {
          buffer.write('children.addAll(${element.name}Constructed);');
        } else {
          buffer.write('children.add(${element.name}Constructed);');
        }

        if (_doesRequireNullCheck(element)) {
          buffer.write(' }');
        }

        buffer.writeln();
      }
    }

    buffer.writeln('return children;');

    buffer.write('}');
  }

  void _generateToXmlElement(StringBuffer buffer, ClassElement element) {
    buffer.write(
      'XmlElement _\$${element.name}ToXmlElement(${element.name} instance, {Map<String, String?> namespaces = const {}}) {\nreturn ${_constructorGeneratorFactory(element).generateConstructor('instance')};\n}',
    );
  }

  /// Creates a [SerializerGenerator] from an [element] and a [type].
  ///
  /// In the example below the [element] is `prefix.Title? title` and the [type] is `Title?`:
  ///
  /// ```dart
  /// ...
  ///
  /// import 'title.dart' as prefix;
  ///
  /// part 'book.g.dart';
  ///
  /// @annotation.XmlRootElement()
  /// @annotation.XmlSerializable()
  /// class Book {
  ///   @annotation.XmlElement()
  ///   prefix.Title? title;
  ///
  ///   ...
  /// }
  /// ```
  ///
  /// In the example below the [element] is `List<prefix.Author>? authors` in both recursions and the [type] is `List<Author>?` in the first recursion and `Author` in the second recursion:
  ///
  /// ```dart
  /// ...
  ///
  /// import 'author.dart' as prefix;
  ///
  /// part 'book.g.dart';
  ///
  /// @annotation.XmlRootElement()
  /// @annotation.XmlSerializable()
  /// class Book {
  ///   @annotation.XmlElement()
  ///   List<prefix.Author>? authors;
  ///
  ///   ...
  /// }
  /// ```
  SerializerGenerator _xmlSerializableSerializerGeneratorFactory(
    FieldElement element, {
    DartType? type,
  }) {
    type ??= element.type;

    if (element.hasXmlElement) {
      final converterElement = element.getXmlConverterElement(type: type);
      if (converterElement != null) {
        return XmlConverterXmlElementSerializerGenerator(
          converterElement.name!,
          isNullable: type.isNullable,
        );
      } else if (type is InterfaceType && type.element.hasXmlSerializable) {
        for (final element in element.library.topLevelElements) {
          if (element == type.element) {
            return XmlSerializableXmlElementSerializerGenerator(
              element.name!,
              isNullable: type.isNullable,
            );
          }
        }

        for (final import in element.library.libraryImports) {
          for (final entry in import.namespace.definedNames.entries) {
            if (entry.value == type.element) {
              return XmlSerializableXmlElementSerializerGenerator(
                entry.key,
                isNullable: type.isNullable,
              );
            }
          }
        }

        return XmlSerializableXmlElementSerializerGenerator(
          type.element.name,
          isNullable: type.isNullable,
        );
      } else if (type is ParameterizedType && type.isDartCoreIterable) {
        return IterableSerializerGenerator(
          _xmlSerializableSerializerGeneratorFactory(
            element,
            type: type.typeArguments.single,
          ),
          isNullable: type.isNullable,
        );
      } else if (type is ParameterizedType && type.isDartCoreList) {
        return ListSerializerGenerator(
          _xmlSerializableSerializerGeneratorFactory(
            element,
            type: type.typeArguments.single,
          ),
          isNullable: type.isNullable,
        );
      } else if (type is ParameterizedType && type.isDartCoreSet) {
        return SetSerializerGenerator(
          _xmlSerializableSerializerGeneratorFactory(
            element,
            type: type.typeArguments.single,
          ),
          isNullable: type.isNullable,
        );
      }
    }

    return _serializerGeneratorFactory(type);
  }
}
