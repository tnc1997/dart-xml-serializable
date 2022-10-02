import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_class_element.dart';
import '../fake_field_element.dart';
import '../fake_interface_type.dart';
import '../fake_iterable_class_element.dart';
import '../fake_string_class_element.dart';
import '../fake_xml_attribute_element_annotation.dart';
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
                FakeXmlAttributeElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlAttributeConstructorGenerator) {
            fail('Expected an XmlAttributeConstructorGenerator');
          }

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
                FakeXmlAttributeElementAnnotation(
                  name: 'name',
                ),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlAttributeConstructorGenerator) {
            fail('Expected an XmlAttributeConstructorGenerator');
          }

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
                FakeXmlAttributeElementAnnotation(
                  name: 'name',
                  namespace: 'https://www.example.com',
                ),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlAttributeConstructorGenerator) {
            fail('Expected an XmlAttributeConstructorGenerator');
          }

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
                  FakeXmlAttributeElementAnnotation(),
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
                FakeXmlElementElementAnnotation(),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element2: FakeClassElement(
                  metadata: [
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ),
              ),
            ),
          );

          if (generator is! XmlSerializableXmlElementConstructorGenerator) {
            fail('Expected an XmlSerializableXmlElementConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(
                  name: 'name',
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element2: FakeClassElement(
                  metadata: [
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ),
              ),
            ),
          );

          if (generator is! XmlSerializableXmlElementConstructorGenerator) {
            fail('Expected an XmlSerializableXmlElementConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(
                  name: 'name',
                  namespace: 'https://www.example.com',
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element2: FakeClassElement(
                  metadata: [
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ),
              ),
            ),
          );

          if (generator is! XmlSerializableXmlElementConstructorGenerator) {
            fail('Expected an XmlSerializableXmlElementConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element2: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element2: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableElementAnnotation(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          if (generator is! IterableConstructorGenerator) {
            fail('Expected an IterableConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(
                  name: 'name',
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element2: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element2: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableElementAnnotation(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          if (generator is! IterableConstructorGenerator) {
            fail('Expected an IterableConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(
                  name: 'name',
                  namespace: 'https://www.example.com',
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element2: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element2: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableElementAnnotation(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          if (generator is! IterableConstructorGenerator) {
            fail('Expected an IterableConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlTextXmlElementConstructorGenerator) {
            fail('Expected an XmlTextXmlElementConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(
                  name: 'name',
                ),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlTextXmlElementConstructorGenerator) {
            fail('Expected an XmlTextXmlElementConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(
                  name: 'name',
                  namespace: 'https://www.example.com',
                ),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlTextXmlElementConstructorGenerator) {
            fail('Expected an XmlTextXmlElementConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element2: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element2: FakeStringClassElement(),
                    isDartCoreString: true,
                  ),
                ],
              ),
            ),
          );

          if (generator is! IterableConstructorGenerator) {
            fail('Expected an IterableConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(
                  name: 'name',
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element2: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element2: FakeStringClassElement(),
                    isDartCoreString: true,
                  ),
                ],
              ),
            ),
          );

          if (generator is! IterableConstructorGenerator) {
            fail('Expected an IterableConstructorGenerator');
          }

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
                FakeXmlElementElementAnnotation(
                  name: 'name',
                  namespace: 'https://www.example.com',
                ),
              ],
              name: 'value',
              type: FakeInterfaceType(
                element2: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element2: FakeStringClassElement(),
                    isDartCoreString: true,
                  ),
                ],
              ),
            ),
          );

          if (generator is! IterableConstructorGenerator) {
            fail('Expected an IterableConstructorGenerator');
          }

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
                  FakeXmlElementElementAnnotation(),
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
                FakeXmlRootElementElementAnnotation(),
              ],
              name: 'HelloWorld',
            ),
          );

          if (generator is! XmlRootElementConstructorGenerator) {
            fail('Expected an XmlRootElementConstructorGenerator');
          }

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
                FakeXmlRootElementElementAnnotation(
                  name: 'name',
                ),
              ],
              name: 'HelloWorld',
            ),
          );

          if (generator is! XmlRootElementConstructorGenerator) {
            fail('Expected an XmlRootElementConstructorGenerator');
          }

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
                FakeXmlRootElementElementAnnotation(
                  name: 'name',
                  namespace: 'https://www.example.com',
                ),
              ],
              name: 'HelloWorld',
            ),
          );

          if (generator is! XmlRootElementConstructorGenerator) {
            fail('Expected an XmlRootElementConstructorGenerator');
          }

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
                  FakeXmlRootElementElementAnnotation(),
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
                FakeXmlTextElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlTextConstructorGenerator) {
            fail('Expected an XmlTextConstructorGenerator');
          }
        },
      );

      test(
        'should throw an argument error if the element has an `XmlText` annotation but is not a field element',
        () {
          expect(
            () => constructorGeneratorFactory(
              FakeClassElement(
                metadata: [
                  FakeXmlTextElementAnnotation(),
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
              FakeFieldElement(
                type: FakeInterfaceType(
                  element2: FakeClassElement(),
                ),
              ),
            ),
            throwsA(isA<ArgumentError>()),
          );
        },
      );
    },
  );
}
