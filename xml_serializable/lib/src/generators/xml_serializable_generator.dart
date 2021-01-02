import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/src/extensions/constant_reader_extensions.dart';
import 'package:xml_serializable/src/extensions/element_extensions.dart';
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

    for (final element in element.fields) {
      if (element.hasXmlAttribute ||
          element.hasXmlElement ||
          element.hasXmlText) {
        buffer.writeln(
          'final ${element.name} = instance.${element.name};',
        );
      }
    }

    buffer.writeln();

    for (final element in element.fields) {
      final elementType = element.type;
      final elementTypeElement = elementType.element;

      if (element.hasXmlAttribute) {
        final annotation = ConstantReader(
          xmlAttributeTypeChecker.firstAnnotationOf(element),
        );

        final name = annotation.peekStringValue('name') ?? element.name;
        final namespace = annotation.peekStringValue('namespace');

        buffer.writeln(
          'if (${element.name} != null) {',
        );

        buffer.writeln(
          'builder.attribute(',
        );

        buffer.writeln(
          '\'$name\',',
        );

        buffer.writeln(
          '${element.name},',
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
      } else if (element.hasXmlElement) {
        final annotation = ConstantReader(
          xmlElementTypeChecker.firstAnnotationOf(element),
        );

        final name = annotation.peekStringValue('name') ?? element.name;
        final namespace = annotation.peekStringValue('namespace');
        final isSelfClosing = annotation.readBoolValue('isSelfClosing');

        if (elementTypeElement.hasXmlSerializable) {
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
            'isSelfClosing: $isSelfClosing,',
          );

          buffer.writeln(
            'nest: () {',
          );

          buffer.writeln(
            'if (${element.name} != null) {',
          );

          buffer.writeln(
            '${element.name}.buildXmlChildren(builder, namespaces: namespaces,);',
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
            'isSelfClosing: $isSelfClosing,',
          );

          buffer.writeln(
            'nest: () {',
          );

          buffer.writeln(
            'if (${element.name} != null) {',
          );

          buffer.writeln(
            'builder.text(${element.name});',
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

            if (elementTypeElement is ClassElement) {
              if (elementTypeElement.hasXmlSerializable) {
                buffer.writeln(
                  'if (${element.name} != null) {',
                );

                buffer.writeln(
                  'for (final value in ${element.name}) {',
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
                  'isSelfClosing: $isSelfClosing,',
                );

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
              } else if (elementTypeElement.thisType.isDartCoreString) {
                buffer.writeln(
                  'if (${element.name} != null) {',
                );

                buffer.writeln(
                  'for (final value in ${element.name}) {',
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
                  'isSelfClosing: $isSelfClosing,',
                );

                buffer.writeln(
                  'nest: () {',
                );

                buffer.writeln(
                  'builder.text(value);',
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
      } else if (element.hasXmlText) {
        buffer.writeln(
          'if (${element.name} != null) {',
        );

        buffer.writeln(
          'builder.text(',
        );

        buffer.writeln(
          '${element.name},',
        );

        buffer.writeln(
          ');',
        );

        buffer.writeln(
          '}',
        );
      }
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
      final elementType = element.type;
      final elementTypeElement = elementType.element;

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

        if (elementTypeElement.hasXmlSerializable) {
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
        } else if (elementType.isDartCoreString) {
          buffer.write(
            'final ${element.name} = element.getElementText(\'$name\',',
          );

          if (namespace != null) {
            buffer.write(
              'namespace: \'$namespace\',',
            );
          }

          buffer.writeln(
            ');',
          );
        } else if (elementType.isDartCoreList || elementType.isDartCoreSet) {
          if (elementType is ParameterizedType) {
            final elementTypeElement = elementType.typeArguments.single.element;

            if (elementTypeElement is ClassElement) {
              if (elementTypeElement.hasXmlSerializable) {
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
              } else if (elementTypeElement.thisType.isDartCoreString) {
                buffer.write(
                  'final ${element.name} = element.findElementsText(\'$name\',',
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
            }
          }
        }
      } else if (element.hasXmlText) {
        buffer.writeln(
          'final ${element.name} = element.getText();',
        );
      }
    }

    buffer.writeln();

    buffer.writeln(
      'return ${element.name}(',
    );

    for (final element in element.fields) {
      final elementType = element.type;
      final elementTypeElement = elementType.element;

      if (element.hasXmlAttribute || element.hasXmlText) {
        if (elementType.isDartCoreString) {
          buffer.write(
            '${element.name}: ${element.name},',
          );
        }
      } else if (element.hasXmlElement) {
        if (elementTypeElement.hasXmlSerializable) {
          buffer.write(
            '${element.name}: ${element.name} != null ? ${elementTypeElement.name}.fromXmlElement(${element.name}) : null,',
          );
        } else if (elementType.isDartCoreString) {
          buffer.write(
            '${element.name}: ${element.name},',
          );
        } else if (elementType.isDartCoreList || elementType.isDartCoreSet) {
          if (elementType is ParameterizedType) {
            final elementTypeElement = elementType.typeArguments.single.element;

            if (elementTypeElement is ClassElement) {
              if (elementTypeElement.hasXmlSerializable) {
                buffer.write(
                  '${element.name}: ${element.name}.map((element) => ${elementTypeElement.name}.fromXmlElement(element)).${elementType.isDartCoreList ? 'toList()' : 'toSet()'},',
                );
              } else if (elementTypeElement.thisType.isDartCoreString) {
                buffer.write(
                  '${element.name}: ${element.name}.${elementType.isDartCoreList ? 'toList()' : 'toSet()'},',
                );
              }
            }
          }
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
      'List<XmlAttribute> _\$${element.name}ToXmlAttributes(${element.name} instance, {Map<String, String?> namespaces = const {},}) {',
    );

    for (final element in element.fields) {
      if (element.hasXmlAttribute) {
        buffer.writeln(
          'final ${element.name} = instance.${element.name};',
        );
      }
    }

    buffer.writeln();

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
          'if (${element.name} != null)',
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
          '${element.name},',
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
      'List<XmlNode> _\$${element.name}ToXmlChildren(${element.name} instance, {Map<String, String?> namespaces = const {},}) {',
    );

    for (final element in element.fields) {
      if (element.hasXmlElement || element.hasXmlText) {
        buffer.writeln(
          'final ${element.name} = instance.${element.name};',
        );
      }
    }

    buffer.writeln();

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
        final isSelfClosing = annotation.readBoolValue('isSelfClosing');

        if (elementTypeElement.hasXmlSerializable) {
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
            '[if (${element.name} != null) ...${element.name}.toXmlAttributes(namespaces: namespaces,),],',
          );

          buffer.writeln(
            '[if (${element.name} != null) ...${element.name}.toXmlChildren(namespaces: namespaces,),],',
          );

          buffer.writeln(
            '$isSelfClosing,',
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
            '[if (${element.name} != null) XmlText(${element.name},),],',
          );

          buffer.writeln(
            '$isSelfClosing,',
          );

          buffer.writeln(
            '),',
          );
        } else if (elementType.isDartCoreList || elementType.isDartCoreSet) {
          if (elementType is ParameterizedType) {
            final elementTypeElement = elementType.typeArguments.single.element;

            if (elementTypeElement is ClassElement) {
              if (elementTypeElement.hasXmlSerializable) {
                buffer.writeln(
                  'if (${element.name} != null)',
                );

                buffer.writeln(
                  'for (final value in ${element.name})',
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
                  '$isSelfClosing,',
                );

                buffer.writeln(
                  '),',
                );
              } else if (elementTypeElement.thisType.isDartCoreString) {
                buffer.writeln(
                  'if (${element.name} != null)',
                );

                buffer.writeln(
                  'for (final value in ${element.name})',
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
                  '[],',
                );

                buffer.writeln(
                  '[XmlText(value,),],',
                );

                buffer.writeln(
                  '$isSelfClosing,',
                );

                buffer.writeln(
                  '),',
                );
              }
            }
          }
        }
      } else if (element.hasXmlText) {
        buffer.writeln(
          'if (${element.name} != null) XmlText(${element.name},),',
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
        'XmlElement _\$${element.name}ToXmlElement(${element.name} instance, {Map<String, String?> namespaces = const {},}) {',
      );

      final annotation = ConstantReader(
        xmlRootElementTypeChecker.firstAnnotationOf(element),
      );

      final name = annotation.peekStringValue('name') ?? element.name;
      final namespace = annotation.peekStringValue('namespace');
      final isSelfClosing = annotation.readBoolValue('isSelfClosing');

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
        '...namespaces.toXmlAttributes(),',
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
        '$isSelfClosing,',
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
