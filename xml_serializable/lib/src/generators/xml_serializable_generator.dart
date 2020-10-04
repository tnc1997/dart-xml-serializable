import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/src/extensions/class_element_extensions.dart';
import 'package:xml_serializable/src/extensions/constant_reader_extensions.dart';
import 'package:xml_serializable/src/extensions/field_element_extensions.dart';
import 'package:xml_serializable/src/type_checkers/xml_attribute_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_element_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_root_element_type_checker.dart';

class XmlSerializableGenerator extends GeneratorForAnnotation<XmlSerializable> {
  const XmlSerializableGenerator();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
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

  void _generateBuildXmlChildren(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      'void _\$${element.name}BuildXmlChildren(${element.name} instance, XmlBuilder builder, {Map<String, String> namespaces = const {},}) {',
    );

    final attributeElements = <FieldElement>{};
    final elementElements = <FieldElement>{};
    final textElements = <FieldElement>{};

    for (final element in element.fields) {
      if (element.hasXmlAttribute) {
        attributeElements.add(element);
      } else if (element.hasXmlElement) {
        elementElements.add(element);
      } else if (element.hasXmlText) {
        textElements.add(element);
      }
    }

    for (final attributeElement in attributeElements) {
      final annotation = ConstantReader(
        xmlAttributeTypeChecker.firstAnnotationOf(attributeElement),
      );

      final name = annotation.peekStringValue('name') ?? attributeElement.name;
      final namespace = annotation.peekStringValue('namespace');

      buffer.writeln(
        'if (instance.${attributeElement.name} != null) {',
      );

      buffer.writeln(
        'builder.attribute(',
      );

      buffer.writeln(
        '\'$name\',',
      );

      buffer.writeln(
        'instance.${attributeElement.name},',
      );

      if (namespace != null) {
        buffer.writeln(
          'namespace: \'$namespace\',',
        );
      }

      buffer.writeln(
        ');',
      );

      buffer.writeln(
        '}',
      );
    }

    for (final elementElement in elementElements) {
      final elementType = elementElement.type;
      final elementTypeElement = elementType.element;

      final annotation = ConstantReader(
        xmlElementTypeChecker.firstAnnotationOf(elementElement),
      );

      final name = annotation.peekStringValue('name') ?? elementElement.name;
      final namespace = annotation.peekStringValue('namespace');

      if (elementTypeElement is ClassElement &&
          elementTypeElement.hasXmlSerializable) {
        buffer.writeln(
          'builder.element(',
        );

        buffer.writeln(
          '\'$name\',',
        );

        if (namespace != null) {
          buffer.writeln(
            'namespace: \'$namespace\',',
          );
        }

        buffer.writeln(
          'nest: () {',
        );

        buffer.writeln(
          'instance.${elementElement.name}?.buildXmlChildren(builder, namespaces: namespaces,);',
        );

        buffer.writeln(
          '},',
        );

        buffer.writeln(
          ');',
        );
      } else if (elementType.isDartCoreString) {
        buffer.writeln(
          'builder.element(',
        );

        buffer.writeln(
          '\'$name\',',
        );

        if (namespace != null) {
          buffer.writeln(
            'namespace: \'$namespace\',',
          );
        }

        buffer.writeln(
          'nest: () {',
        );

        buffer.writeln(
          'if (instance.${elementElement.name} != null) {',
        );

        buffer.writeln(
          'builder.text(instance.${elementElement.name},);',
        );

        buffer.writeln(
          '}',
        );

        buffer.writeln(
          '},',
        );

        buffer.writeln(
          ');',
        );
      } else if (elementType.isDartCoreList || elementType.isDartCoreSet) {
        if (elementType is ParameterizedType) {
          final elementTypeElement = elementType.typeArguments.single.element;

          if (elementTypeElement is ClassElement &&
              elementTypeElement.hasXmlSerializable) {
            buffer.writeln(
              'if (instance.${elementElement.name} != null) {',
            );

            buffer.writeln(
              'for (final value in instance.${elementElement.name}) {',
            );

            buffer.writeln(
              'builder.element(',
            );

            buffer.writeln(
              '\'$name\',',
            );

            if (namespace != null) {
              buffer.writeln(
                'namespace: \'$namespace\',',
              );
            }

            buffer.writeln(
              'nest: () {',
            );

            buffer.writeln(
              'value.buildXmlChildren(builder, namespaces: namespaces,);',
            );

            buffer.writeln(
              '},',
            );

            buffer.writeln(
              ');',
            );

            buffer.writeln(
              '}',
            );

            buffer.writeln(
              '}',
            );
          }
        }
      }
    }

    for (final textElement in textElements) {
      buffer.writeln(
        'if (instance.${textElement.name} != null) {',
      );

      buffer.writeln(
        'builder.text(instance.${textElement.name},);',
      );

      buffer.writeln(
        '}',
      );
    }

    buffer.writeln(
      '}',
    );
  }

  void _generateBuildXmlElement(StringBuffer buffer, ClassElement element) {
    if (element.hasXmlRootElement) {
      buffer.writeln(
        'void _\$${element.name}BuildXmlElement(${element.name} instance, XmlBuilder builder, {Map<String, String> namespaces = const {},}) {',
      );

      final annotation = ConstantReader(
        xmlRootElementTypeChecker.firstAnnotationOf(element),
      );

      final name = annotation.peekStringValue('name') ?? element.name;
      final namespace = annotation.peekStringValue('namespace');

      buffer.writeln(
        'builder.element(',
      );

      buffer.writeln(
        '\'$name\',',
      );

      if (namespace != null) {
        buffer.writeln(
          'namespace: \'$namespace\',',
        );
      }

      buffer.writeln(
        'namespaces: namespaces,',
      );

      buffer.writeln(
        'nest: () {',
      );

      buffer.writeln(
        'instance.buildXmlChildren(builder, namespaces: namespaces,);',
      );

      buffer.writeln(
        '},',
      );

      buffer.writeln(
        ');',
      );

      buffer.writeln(
        '}',
      );
    }
  }

  void _generateFromXmlElement(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      '${element.name} _\$${element.name}FromXmlElement(XmlElement element) {',
    );

    for (final element in element.fields) {
      if (element.hasXmlAttribute) {
        final annotation = ConstantReader(
          xmlAttributeTypeChecker.firstAnnotationOf(element),
        );

        final name = annotation.peekStringValue('name') ?? element.name;
        final namespace = annotation.peekStringValue('namespace');

        buffer.write(
          'final ${element.name} = element.getAttribute(\'$name\',',
        );

        if (namespace != null) {
          buffer.write(
            'namespace: \'$namespace\',',
          );
        }

        buffer.writeln(
          ');',
        );
      } else if (element.hasXmlElement) {
        final annotation = ConstantReader(
          xmlElementTypeChecker.firstAnnotationOf(element),
        );

        final name = annotation.peekStringValue('name') ?? element.name;
        final namespace = annotation.peekStringValue('namespace');

        if (element.type.isDartCoreList || element.type.isDartCoreSet) {
          buffer.write(
            'final ${element.name} = element.findElements(\'$name\',',
          );

          if (namespace != null) {
            buffer.write(
              'namespace: \'$namespace\',',
            );
          }

          buffer.writeln(
            ');',
          );
        } else {
          buffer.write(
            'final ${element.name} = element.getElement(\'$name\',',
          );

          if (namespace != null) {
            buffer.write(
              'namespace: \'$namespace\',',
            );
          }

          buffer.writeln(
            ');',
          );
        }
      } else if (element.hasXmlText) {
        buffer.writeln(
          'final ${element.name} = element.text;',
        );
      }
    }

    buffer.writeln();

    buffer.writeln(
      'return ${element.name}(',
    );

    for (final element in element.fields) {
      if (element.hasXmlElement) {
        final elementType = element.type;
        final elementTypeElement = elementType.element;

        if (elementTypeElement is ClassElement &&
            elementTypeElement.hasXmlSerializable) {
          buffer.write(
            '${element.name}: ${element.name} != null ? ${elementType.element.name}.fromXmlElement(${element.name}) : null,',
          );
        } else if (elementType.isDartCoreString) {
          buffer.write(
            '${element.name}: ${element.name} != null ? ${element.name}.text : null,',
          );
        } else if ((elementType.isDartCoreList || elementType.isDartCoreSet)) {
          if (elementType is ParameterizedType) {
            final elementTypeElement = elementType.typeArguments.single.element;

            if (elementTypeElement is ClassElement &&
                elementTypeElement.hasXmlSerializable) {
              buffer.write(
                '${element.name}: ${element.name} != null ? ${element.name}.map((element) => ${elementType.typeArguments.single.element.name}.fromXmlElement(element)).${elementType.isDartCoreList ? 'toList()' : 'toSet()'} : null,',
              );
            }
          }
        }
      } else {
        if (element.type.isDartCoreString) {
          buffer.write(
            '${element.name}: ${element.name},',
          );
        }
      }
    }

    buffer.writeln(
      ');',
    );

    buffer.writeln(
      '}',
    );
  }

  void _generateToXmlAttributes(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      'List<XmlAttribute> _\$${element.name}ToXmlAttributes(${element.name} instance, {Map<String, String> namespaces = const {},}) {',
    );

    buffer.writeln(
      'return [',
    );

    for (final element in element.fields) {
      if (element.hasXmlAttribute) {
        final annotation = ConstantReader(
          xmlAttributeTypeChecker.firstAnnotationOf(element),
        );

        final name = annotation.peekStringValue('name') ?? element.name;
        final namespace = annotation.peekStringValue('namespace');

        buffer.writeln(
          'if (instance.${element.name} != null)',
        );

        buffer.writeln(
          'XmlAttribute(',
        );

        buffer.writeln(
          'XmlName(',
        );

        buffer.writeln(
          '\'$name\',',
        );

        if (namespace != null) {
          buffer.writeln(
            'namespaces[\'$namespace\'],',
          );
        }

        buffer.writeln(
          '),',
        );

        buffer.writeln(
          'instance.${element.name},',
        );

        buffer.writeln(
          '),',
        );
      }
    }

    buffer.writeln(
      '];',
    );

    buffer.writeln(
      '}',
    );
  }

  void _generateToXmlChildren(StringBuffer buffer, ClassElement element) {
    buffer.writeln(
      'List<XmlNode> _\$${element.name}ToXmlChildren(${element.name} instance, {Map<String, String> namespaces = const {},}) {',
    );

    buffer.writeln(
      'return [',
    );

    for (final element in element.fields) {
      if (element.hasXmlElement) {
        final elementType = element.type;
        final elementTypeElement = elementType.element;

        final annotation = ConstantReader(
          xmlElementTypeChecker.firstAnnotationOf(element),
        );

        final name = annotation.peekStringValue('name') ?? element.name;
        final namespace = annotation.peekStringValue('namespace');

        if (elementTypeElement is ClassElement &&
            elementTypeElement.hasXmlSerializable) {
          buffer.writeln(
            'XmlElement(',
          );

          buffer.writeln(
            'XmlName(',
          );

          buffer.writeln(
            '\'$name\',',
          );

          if (namespace != null) {
            buffer.writeln(
              'namespaces[\'$namespace\'],',
            );
          }

          buffer.writeln(
            '),',
          );

          buffer.writeln(
            'instance.${element.name}?.toXmlAttributes(namespaces: namespaces,) ?? [],',
          );

          buffer.writeln(
            'instance.${element.name}?.toXmlChildren(namespaces: namespaces,) ?? [],',
          );

          buffer.writeln(
            '),',
          );
        } else if (elementType.isDartCoreString) {
          buffer.writeln(
            'XmlElement(',
          );

          buffer.writeln(
            'XmlName(',
          );

          buffer.writeln(
            '\'$name\',',
          );

          if (namespace != null) {
            buffer.writeln(
              'namespaces[\'$namespace\'],',
            );
          }

          buffer.writeln(
            '),',
          );

          buffer.writeln(
            '[],',
          );

          buffer.writeln(
            '[if (instance.${element.name} != null) XmlText(instance.${element.name},),],',
          );

          buffer.writeln(
            '),',
          );
        } else if (elementType.isDartCoreList || elementType.isDartCoreSet) {
          if (elementType is ParameterizedType) {
            final elementTypeElement = elementType.typeArguments.single.element;

            if (elementTypeElement is ClassElement &&
                elementTypeElement.hasXmlSerializable) {
              buffer.writeln(
                'if (instance.${element.name} != null)',
              );

              buffer.writeln(
                'for (final value in instance.${element.name})',
              );

              buffer.writeln(
                'XmlElement(',
              );

              buffer.writeln(
                'XmlName(',
              );

              buffer.writeln(
                '\'$name\',',
              );

              if (namespace != null) {
                buffer.writeln(
                  'namespaces[\'$namespace\'],',
                );
              }

              buffer.writeln(
                '),',
              );

              buffer.writeln(
                'value.toXmlAttributes(namespaces: namespaces,),',
              );

              buffer.writeln(
                'value.toXmlChildren(namespaces: namespaces,),',
              );

              buffer.writeln(
                '),',
              );
            }
          }
        }
      } else if (element.hasXmlText) {
        buffer.writeln(
          'if (instance.${element.name} != null)',
        );

        buffer.writeln(
          'XmlText(instance.${element.name},),',
        );
      }
    }

    buffer.writeln(
      '];',
    );

    buffer.writeln(
      '}',
    );
  }

  void _generateToXmlElement(StringBuffer buffer, ClassElement element) {
    if (element.hasXmlRootElement) {
      buffer.writeln(
        'XmlElement _\$${element.name}ToXmlElement(${element.name} instance, {Map<String, String> namespaces = const {},}) {',
      );

      final annotation = ConstantReader(
        xmlRootElementTypeChecker.firstAnnotationOf(element),
      );

      final name = annotation.peekStringValue('name') ?? element.name;
      final namespace = annotation.peekStringValue('namespace');

      buffer.writeln(
        'return XmlElement(',
      );

      buffer.writeln(
        'XmlName(\'$name\', ${namespace != null ? 'namespaces[\'$namespace\'],' : ''}),',
      );

      buffer.writeln(
        '[',
      );

      buffer.writeln(
        'for (final entry in namespaces.entries)',
      );

      buffer.writeln(
        'XmlAttribute(entry.value != null ? XmlName(entry.value, \'xmlns\',) : XmlName(\'xmlns\',), entry.key,),',
      );

      buffer.writeln(
        '...instance.toXmlAttributes(namespaces: namespaces,),',
      );

      buffer.writeln(
        '],',
      );

      buffer.writeln(
        'instance.toXmlChildren(namespaces: namespaces,),',
      );

      buffer.writeln(
        ');',
      );

      buffer.writeln(
        '}',
      );
    }
  }
}
