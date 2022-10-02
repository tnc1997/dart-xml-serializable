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
    'BuilderGeneratorFactory',
    () {
      test(
        'should create an `XmlAttributeBuilderGenerator` with the field name if the field element has an `XmlAttribute` annotation without a name',
        () {
          final generator = builderGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlAttributeElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlAttributeBuilderGenerator) {
            fail('Expected an XmlAttributeBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals('builder.attribute(\'value\', value);'),
          );
        },
      );

      test(
        'should create an `XmlAttributeBuilderGenerator` with the `XmlAttribute` name if the field element has an `XmlAttribute` annotation with a name',
        () {
          final generator = builderGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlAttributeElementAnnotation(
                  name: 'name',
                ),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlAttributeBuilderGenerator) {
            fail('Expected an XmlAttributeBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals('builder.attribute(\'name\', value);'),
          );
        },
      );

      test(
        'should create an `XmlAttributeBuilderGenerator` with the `XmlAttribute` name and namespace if the field element has an `XmlAttribute` annotation with a name and namespace',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! XmlAttributeBuilderGenerator) {
            fail('Expected an XmlAttributeBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.attribute(\'name\', value, namespace: \'https://www.example.com\');',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlAttribute` annotation but is not a field element',
        () {
          expect(
            () => builderGeneratorFactory(
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
        'should create an `XmlSerializableXmlElementBuilderGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! XmlSerializableXmlElementBuilderGenerator) {
            fail('Expected an XmlSerializableXmlElementBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.element(\'value\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
            ),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementBuilderGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! XmlSerializableXmlElementBuilderGenerator) {
            fail('Expected an XmlSerializableXmlElementBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.element(\'name\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
            ),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementBuilderGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! XmlSerializableXmlElementBuilderGenerator) {
            fail('Expected an XmlSerializableXmlElementBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.element(\'name\', namespace: \'https://www.example.com\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
            ),
          );
        },
      );

      test(
        'should create an `IterableBuilderGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! IterableBuilderGenerator) {
            fail('Expected an IterableBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'for (final value in value) { builder.element(\'value\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); }); }',
            ),
          );
        },
      );

      test(
        'should create an `IterableBuilderGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! IterableBuilderGenerator) {
            fail('Expected an IterableBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'for (final value in value) { builder.element(\'name\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); }); }',
            ),
          );
        },
      );

      test(
        'should create an `IterableBuilderGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! IterableBuilderGenerator) {
            fail('Expected an IterableBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'for (final value in value) { builder.element(\'name\', namespace: \'https://www.example.com\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); }); }',
            ),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementBuilderGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = builderGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlTextXmlElementBuilderGenerator) {
            fail('Expected an XmlTextXmlElementBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
                'builder.element(\'value\', nest: () { builder.text(value); });'),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementBuilderGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = builderGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementElementAnnotation(
                  name: 'name',
                ),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlTextXmlElementBuilderGenerator) {
            fail('Expected an XmlTextXmlElementBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
                'builder.element(\'name\', nest: () { builder.text(value); });'),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementBuilderGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! XmlTextXmlElementBuilderGenerator) {
            fail('Expected an XmlTextXmlElementBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.element(\'name\', namespace: \'https://www.example.com\', nest: () { builder.text(value); });',
            ),
          );
        },
      );

      test(
        'should create an `IterableBuilderGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! IterableBuilderGenerator) {
            fail('Expected an IterableBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'for (final value in value) { builder.element(\'value\', nest: () { builder.text(value); }); }',
            ),
          );
        },
      );

      test(
        'should create an `IterableBuilderGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! IterableBuilderGenerator) {
            fail('Expected an IterableBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'for (final value in value) { builder.element(\'name\', nest: () { builder.text(value); }); }',
            ),
          );
        },
      );

      test(
        'should create an `IterableBuilderGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! IterableBuilderGenerator) {
            fail('Expected an IterableBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'for (final value in value) { builder.element(\'name\', namespace: \'https://www.example.com\', nest: () { builder.text(value); }); }',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlElement` annotation but is not a field element',
        () {
          expect(
            () => builderGeneratorFactory(
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
        'should create an `XmlRootElementBuilderGenerator` with the class name if the class element has an `XmlRootElement` annotation without a name',
        () {
          final generator = builderGeneratorFactory(
            FakeClassElement(
              metadata: [
                FakeXmlRootElementElementAnnotation(),
              ],
              name: 'HelloWorld',
            ),
          );

          if (generator is! XmlRootElementBuilderGenerator) {
            fail('Expected an XmlRootElementBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.element(\'HelloWorld\', namespaces: namespaces, nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
            ),
          );
        },
      );

      test(
        'should create an `XmlRootElementBuilderGenerator` with the `XmlRootElement` name if the class element has an `XmlRootElement` annotation with a name',
        () {
          final generator = builderGeneratorFactory(
            FakeClassElement(
              metadata: [
                FakeXmlRootElementElementAnnotation(
                  name: 'name',
                ),
              ],
              name: 'HelloWorld',
            ),
          );

          if (generator is! XmlRootElementBuilderGenerator) {
            fail('Expected an XmlRootElementBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.element(\'name\', namespaces: namespaces, nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
            ),
          );
        },
      );

      test(
        'should create an `XmlRootElementBuilderGenerator` with the `XmlRootElement` name and namespace if the class element has an `XmlRootElement` annotation with a name and namespace',
        () {
          final generator = builderGeneratorFactory(
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

          if (generator is! XmlRootElementBuilderGenerator) {
            fail('Expected an XmlRootElementBuilderGenerator');
          }

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.element(\'name\', namespace: \'https://www.example.com\', namespaces: namespaces, nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlRootElement` annotation but is not a class element',
        () {
          expect(
            () => builderGeneratorFactory(
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
        'should create an `XmlTextBuilderGenerator` if the field element has an `XmlText` annotation',
        () {
          final generator = builderGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlTextElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          if (generator is! XmlTextBuilderGenerator) {
            fail('Expected an XmlTextBuilderGenerator');
          }
        },
      );

      test(
        'should throw an argument error if the element has an `XmlText` annotation but is not a field element',
        () {
          expect(
            () => builderGeneratorFactory(
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
            () => builderGeneratorFactory(FakeFieldElement()),
            throwsA(isA<ArgumentError>()),
          );
        },
      );
    },
  );
}
