import 'package:test/test.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_class_element.dart';
import '../fake_field_element.dart';
import '../fake_interface_type.dart';
import '../fake_iterable_class_element.dart';
import '../fake_string_class_element.dart';
import '../fake_xml_attribute_element_annotation.dart';
import '../fake_xml_cdata_element_annotation.dart';
import '../fake_xml_element_element_annotation.dart';
import '../fake_xml_root_element_element_annotation.dart';
import '../fake_xml_serializable_element_annotation.dart';
import '../fake_xml_text_element_annotation.dart';

void main() {
  group(
    'ConstructorGeneratorFactory',
    () {
      test(
        'should create an `XmlAttributeConstructorGenerator` with the field name if the field element has an `XmlAttribute` annotation without a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlAttributeConstructorElementElementAnnotation(
                  value: XmlAttribute(),
                ),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlAttributeConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals('XmlAttribute(XmlName(\'value\'), value)'),
          );
        },
      );

      test(
        'should create an `XmlAttributeConstructorGenerator` with the `XmlAttribute` name if the field element has an `XmlAttribute` annotation with a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlAttributeConstructorElementElementAnnotation(
                  value: XmlAttribute(
                    name: 'name',
                  ),
                ),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlAttributeConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals('XmlAttribute(XmlName(\'name\'), value)'),
          );
        },
      );

      test(
        'should create an `XmlAttributeConstructorGenerator` with the `XmlAttribute` name and namespace if the field element has an `XmlAttribute` annotation with a name and namespace',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlAttributeConstructorElementElementAnnotation(
                  value: XmlAttribute(
                    name: 'name',
                    namespace: 'https://www.example.com',
                  ),
                ),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlAttributeConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlAttribute(XmlName(\'name\', namespaces[\'https://www.example.com\']), value)',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlAttribute` annotation but is not a field element',
        () {
          expect(
            () => constructorGeneratorFactory(
              FakeClassElement(
                metadata: [
                  FakeXmlAttributeConstructorElementElementAnnotation(
                    value: XmlAttribute(),
                  ),
                ],
              ),
            ),
            throwsA(isA<ArgumentError>()),
          );
        },
      );

      test(
        'should create an `XmlCDATAConstructorGenerator` if the field element has an `XmlCDATA` annotation',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlCDATAConstructorElementElementAnnotation(
                  value: XmlCDATA(),
                ),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlCDATAConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlCDATA(value)',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlCDATA` annotation but is not a field element',
        () {
          expect(
            () => constructorGeneratorFactory(
              FakeClassElement(
                metadata: [
                  FakeXmlCDATAConstructorElementElementAnnotation(
                    value: XmlCDATA(),
                  ),
                ],
              ),
            ),
            throwsA(isA<ArgumentError>()),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementConstructorGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(),
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element: FakeClassElement(
                  metadata: [
                    FakeXmlSerializableConstructorElementElementAnnotation(
                      value: XmlSerializable(),
                    ),
                  ],
                ),
              ),
            ),
          );

          expect(
            generator,
            isA<XmlSerializableXmlElementConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlElement(XmlName(\'value\'), value.toXmlAttributes(namespaces: namespaces), value.toXmlChildren(namespaces: namespaces))',
            ),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementConstructorGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(
                    name: 'name',
                  ),
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element: FakeClassElement(
                  metadata: [
                    FakeXmlSerializableConstructorElementElementAnnotation(
                      value: XmlSerializable(),
                    ),
                  ],
                ),
              ),
            ),
          );

          expect(
            generator,
            isA<XmlSerializableXmlElementConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlElement(XmlName(\'name\'), value.toXmlAttributes(namespaces: namespaces), value.toXmlChildren(namespaces: namespaces))',
            ),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementConstructorGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(
                    name: 'name',
                    namespace: 'https://www.example.com',
                  ),
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element: FakeClassElement(
                  metadata: [
                    FakeXmlSerializableConstructorElementElementAnnotation(
                      value: XmlSerializable(),
                    ),
                  ],
                ),
              ),
            ),
          );

          expect(
            generator,
            isA<XmlSerializableXmlElementConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlElement(XmlName(\'name\', namespaces[\'https://www.example.com\']), value.toXmlAttributes(namespaces: namespaces), value.toXmlChildren(namespaces: namespaces))',
            ),
          );
        },
      );

      test(
        'should create an `IterableConstructorGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(),
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableConstructorElementElementAnnotation(
                          value: XmlSerializable(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          expect(
            generator,
            isA<IterableConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'value.map((e) => XmlElement(XmlName(\'value\'), e.toXmlAttributes(namespaces: namespaces), e.toXmlChildren(namespaces: namespaces)))',
            ),
          );
        },
      );

      test(
        'should create an `IterableConstructorGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(
                    name: 'name',
                  ),
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableConstructorElementElementAnnotation(
                          value: XmlSerializable(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          expect(
            generator,
            isA<IterableConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'value.map((e) => XmlElement(XmlName(\'name\'), e.toXmlAttributes(namespaces: namespaces), e.toXmlChildren(namespaces: namespaces)))',
            ),
          );
        },
      );

      test(
        'should create an `IterableConstructorGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(
                    name: 'name',
                    namespace: 'https://www.example.com',
                  ),
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableConstructorElementElementAnnotation(
                          value: XmlSerializable(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          expect(
            generator,
            isA<IterableConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'value.map((e) => XmlElement(XmlName(\'name\', namespaces[\'https://www.example.com\']), e.toXmlAttributes(namespaces: namespaces), e.toXmlChildren(namespaces: namespaces)))',
            ),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementConstructorGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(),
                ),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlTextXmlElementConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals('XmlElement(XmlName(\'value\'), [], [XmlText(value)])'),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementConstructorGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(
                    name: 'name',
                  ),
                ),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlTextXmlElementConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals('XmlElement(XmlName(\'name\'), [], [XmlText(value)])'),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementConstructorGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(
                    name: 'name',
                    namespace: 'https://www.example.com',
                  ),
                ),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlTextXmlElementConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlElement(XmlName(\'name\', namespaces[\'https://www.example.com\']), [], [XmlText(value)])',
            ),
          );
        },
      );

      test(
        'should create an `IterableConstructorGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(),
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element: FakeStringClassElement(),
                    isDartCoreString: true,
                  ),
                ],
              ),
            ),
          );

          expect(
            generator,
            isA<IterableConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'value.map((e) => XmlElement(XmlName(\'value\'), [], [XmlText(e)]))',
            ),
          );
        },
      );

      test(
        'should create an `IterableConstructorGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(
                    name: 'name',
                  ),
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element: FakeStringClassElement(),
                    isDartCoreString: true,
                  ),
                ],
              ),
            ),
          );

          expect(
            generator,
            isA<IterableConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'value.map((e) => XmlElement(XmlName(\'name\'), [], [XmlText(e)]))',
            ),
          );
        },
      );

      test(
        'should create an `IterableConstructorGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(
                    name: 'name',
                    namespace: 'https://www.example.com',
                  ),
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element: FakeStringClassElement(),
                    isDartCoreString: true,
                  ),
                ],
              ),
            ),
          );

          expect(
            generator,
            isA<IterableConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'value.map((e) => XmlElement(XmlName(\'name\', namespaces[\'https://www.example.com\']), [], [XmlText(e)]))',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlElement` annotation but is not a field element',
        () {
          expect(
            () => constructorGeneratorFactory(
              FakeClassElement(
                metadata: [
                  FakeXmlElementConstructorElementElementAnnotation(
                    value: XmlElement(),
                  ),
                ],
              ),
            ),
            throwsA(isA<ArgumentError>()),
          );
        },
      );

      test(
        'should create an `XmlRootElementConstructorGenerator` with the class name if the class element has an `XmlRootElement` annotation without a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeClassElement(
              metadata: [
                FakeXmlRootElementConstructorElementElementAnnotation(
                  value: XmlRootElement(),
                ),
              ],
              name: 'HelloWorld',
            ),
          );

          expect(
            generator,
            isA<XmlRootElementConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlElement(XmlName(\'HelloWorld\'), [...namespaces.toXmlAttributes(), ...value.toXmlAttributes(namespaces: namespaces)], value.toXmlChildren(namespaces: namespaces))',
            ),
          );
        },
      );

      test(
        'should create an `XmlRootElementConstructorGenerator` with the `XmlRootElement` name if the class element has an `XmlRootElement` annotation with a name',
        () {
          final generator = constructorGeneratorFactory(
            FakeClassElement(
              metadata: [
                FakeXmlRootElementConstructorElementElementAnnotation(
                  value: XmlRootElement(
                    name: 'name',
                  ),
                ),
              ],
              name: 'HelloWorld',
            ),
          );

          expect(
            generator,
            isA<XmlRootElementConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlElement(XmlName(\'name\'), [...namespaces.toXmlAttributes(), ...value.toXmlAttributes(namespaces: namespaces)], value.toXmlChildren(namespaces: namespaces))',
            ),
          );
        },
      );

      test(
        'should create an `XmlRootElementConstructorGenerator` with the `XmlRootElement` name and namespace if the class element has an `XmlRootElement` annotation with a name and namespace',
        () {
          final generator = constructorGeneratorFactory(
            FakeClassElement(
              metadata: [
                FakeXmlRootElementConstructorElementElementAnnotation(
                  value: XmlRootElement(
                    name: 'name',
                    namespace: 'https://www.example.com',
                  ),
                ),
              ],
              name: 'HelloWorld',
            ),
          );

          expect(
            generator,
            isA<XmlRootElementConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlElement(XmlName(\'name\', namespaces[\'https://www.example.com\']), [...namespaces.toXmlAttributes(), ...value.toXmlAttributes(namespaces: namespaces)], value.toXmlChildren(namespaces: namespaces))',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlRootElement` annotation but is not a class element',
        () {
          expect(
            () => constructorGeneratorFactory(
              FakeFieldElement(
                metadata: [
                  FakeXmlRootElementConstructorElementElementAnnotation(
                    value: XmlRootElement(),
                  ),
                ],
              ),
            ),
            throwsA(isA<ArgumentError>()),
          );
        },
      );

      test(
        'should create an `XmlTextConstructorGenerator` if the field element has an `XmlText` annotation',
        () {
          final generator = constructorGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlTextConstructorElementElementAnnotation(
                  value: XmlText(),
                ),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlTextConstructorGenerator>(),
          );

          expect(
            generator.generateConstructor('value'),
            equals(
              'XmlText(value)',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlText` annotation but is not a field element',
        () {
          expect(
            () => constructorGeneratorFactory(
              FakeClassElement(
                metadata: [
                  FakeXmlTextConstructorElementElementAnnotation(
                    value: XmlText(),
                  ),
                ],
              ),
            ),
            throwsA(isA<ArgumentError>()),
          );
        },
      );

      test(
        'should throw an argument error if the element is unsupported',
        () {
          expect(
            () => constructorGeneratorFactory(
              FakeFieldElement(),
            ),
            throwsA(isA<ArgumentError>()),
          );
        },
      );
    },
  );
}
