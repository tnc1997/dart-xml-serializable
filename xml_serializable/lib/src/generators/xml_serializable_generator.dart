import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/src/generator_factories/builder_generator_factory.dart';

import '../extensions/dart_object_extensions.dart';
import '../extensions/dart_type_extensions.dart';
import '../extensions/element_extensions.dart';
import '../generator_factories/constructor_generator_factory.dart';
import '../generator_factories/getter_generator_factory.dart';
import '../generator_factories/serializer_generator_factory.dart';
import '../serializer_generators/iterable_serializer_generator.dart';
import '../serializer_generators/serializer_generator.dart';

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
      final buffer = StringBuffer();

      _generateBuildXmlChildren(buffer, element);

      buffer.writeln();

      _generateBuildXmlElement(buffer, element);

      buffer.writeln();

      _generateFromXmlElement(buffer, element);

      buffer.writeln();

      _generateToXmlAttributes(buffer, element);

      buffer.writeln();

      _generateToXmlChildren(buffer, element);

      buffer.writeln();

      _generateToXmlElement(buffer, element);

      buffer.writeln();

      return buffer.toString();
    } else {
      throw InvalidGenerationSourceError(
        '`@XmlSerializable` can only be used on classes.',
        element: element,
      );
    }
  }

  bool _doesRequireNullCheck(FieldElement element) => element.hasXmlElement
      ? element.type.isNullable &&
          (element.getXmlElement()?.getBoolValue('includeIfNull') == false ||
              element.type.isDartCoreIterable ||
              element.type.isDartCoreList ||
              element.type.isDartCoreSet)
      : element.type.isNullable;

  void _generateBuildXmlChildren(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      'void _\$${element.name}BuildXmlChildren(${element.name} instance, XmlBuilder builder, {Map<String, String> namespaces = const {},}) {',
    );

    for (final element in element.fields) {
      if (element.hasXmlAttribute ||
          element.hasXmlElement ||
          element.hasXmlText) {
        buffer.writeln(
          'final ${element.name} = instance.${element.name};',
        );

        buffer.writeln(
          'final ${element.name}Serialized = ${_xmlSerializableSerializerGeneratorFactory(element.type).generateSerializer(element.name)};',
        );

        buffer.writeln(
          _builderGeneratorFactory(element).generateBuilder(
            '${element.name}Serialized',
          ),
        );
      }
    }

    buffer.writeln('}');
  }

  void _generateBuildXmlElement(StringBuffer buffer, ClassElement element) {
    if (element.hasXmlRootElement) {
      buffer.writeln(
        'void _\$${element.name}BuildXmlElement(${element.name} instance, XmlBuilder builder, {Map<String, String> namespaces = const {},}) { ${_builderGeneratorFactory(element).generateBuilder('instance')} }',
      );
    }
  }

  void _generateFromXmlElement(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      '${element.name} _\$${element.name}FromXmlElement(XmlElement element) {',
    );

    for (final element in element.fields) {
      buffer.writeln(
        'final ${element.name} = ${_getterGeneratorFactory(element).generateGetter('element')};',
      );
    }

    buffer.writeln('return ${element.name}(');

    for (final element in element.fields) {
      buffer.writeln(
        '${element.name}: ${_xmlSerializableSerializerGeneratorFactory(element.type).generateDeserializer(element.name)},',
      );
    }

    buffer.writeln(');');

    buffer.writeln('}');
  }

  void _generateToXmlAttributes(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      'List<XmlAttribute> _\$${element.name}ToXmlAttributes(${element.name} instance, {Map<String, String?> namespaces = const {},}) {',
    );

    buffer.writeln('final attributes = <XmlAttribute>[];');

    for (final element in element.fields) {
      if (element.hasXmlAttribute) {
        buffer.writeln('final ${element.name} = instance.${element.name};');

        buffer.writeln(
          'final ${element.name}Serialized = ${_xmlSerializableSerializerGeneratorFactory(element.type).generateSerializer(element.name)};',
        );

        buffer.writeln(
          'final ${element.name}Constructed = ${_constructorGeneratorFactory(element).generateConstructor('${element.name}Serialized')};',
        );

        if (_doesRequireNullCheck(element)) {
          buffer.writeln('if (${element.name}Constructed != null) {');
        }

        if (element.type.isDartCoreIterable ||
            element.type.isDartCoreList ||
            element.type.isDartCoreSet) {
          buffer.writeln('attributes.addAll(${element.name}Constructed);');
        } else {
          buffer.writeln('attributes.add(${element.name}Constructed);');
        }

        if (_doesRequireNullCheck(element)) {
          buffer.writeln('}');
        }
      }
    }

    buffer.write('return attributes;');

    buffer.writeln('}');
  }

  void _generateToXmlChildren(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      'List<XmlNode> _\$${element.name}ToXmlChildren(${element.name} instance, {Map<String, String?> namespaces = const {},}) {',
    );

    buffer.writeln('final children = <XmlNode>[];');

    for (final element in element.fields) {
      if (element.hasXmlElement || element.hasXmlText) {
        buffer.writeln('final ${element.name} = instance.${element.name};');

        buffer.writeln(
          'final ${element.name}Serialized = ${_xmlSerializableSerializerGeneratorFactory(element.type).generateSerializer(element.name)};',
        );

        buffer.writeln(
          'final ${element.name}Constructed = ${_constructorGeneratorFactory(element).generateConstructor('${element.name}Serialized')};',
        );

        if (_doesRequireNullCheck(element)) {
          buffer.writeln('if (${element.name}Constructed != null) {');
        }

        if (element.type.isDartCoreIterable ||
            element.type.isDartCoreList ||
            element.type.isDartCoreSet) {
          buffer.writeln('children.addAll(${element.name}Constructed);');
        } else {
          buffer.writeln('children.add(${element.name}Constructed);');
        }

        if (_doesRequireNullCheck(element)) {
          buffer.writeln('}');
        }
      }
    }

    buffer.write('return children;');

    buffer.writeln('}');
  }

  void _generateToXmlElement(StringBuffer buffer, ClassElement element) {
    if (element.hasXmlRootElement) {
      buffer.writeln(
        'XmlElement _\$${element.name}ToXmlElement(${element.name} instance, {Map<String, String?> namespaces = const {},}) { return ${_constructorGeneratorFactory(element).generateConstructor('instance')}; }',
      );
    }
  }

  SerializerGenerator _xmlSerializableSerializerGeneratorFactory(
    DartType type,
  ) {
    if (type is InterfaceType && type.element.hasXmlSerializable) {
      return _XmlSerializableSerializerGenerator(type);
    } else if (type is ParameterizedType && type.isDartCoreIterable) {
      return IterableSerializerGenerator(
        _xmlSerializableSerializerGeneratorFactory(type.typeArguments.single),
        isNullable: type.isNullable,
      );
    } else if (type is ParameterizedType && type.isDartCoreList) {
      return ListSerializerGenerator(
        _xmlSerializableSerializerGeneratorFactory(type.typeArguments.single),
        isNullable: type.isNullable,
      );
    } else if (type is ParameterizedType && type.isDartCoreSet) {
      return SetSerializerGenerator(
        _xmlSerializableSerializerGeneratorFactory(type.typeArguments.single),
        isNullable: type.isNullable,
      );
    } else {
      return _serializerGeneratorFactory(type);
    }
  }
}

class _XmlSerializableSerializerGenerator extends SerializerGenerator {
  final InterfaceType _type;

  const _XmlSerializableSerializerGenerator(this._type);

  @override
  String generateSerializer(String expression) => expression;

  @override
  String generateDeserializer(String expression) {
    final buffer = StringBuffer();

    if (_type.isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('${_type.element.name}.fromXmlElement($expression)');

    if (_type.isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}
