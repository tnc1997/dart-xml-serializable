import 'package:test/test.dart';
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

          expect(
            generator,
            isA<XmlAttributeBuilderGenerator>(),
          );

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

          expect(
            generator,
            isA<XmlAttributeBuilderGenerator>(),
          );

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

          expect(
            generator,
            isA<XmlAttributeBuilderGenerator>(),
          );

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
        'should create an `XmlCDATABuilderGenerator` if the field element has an `XmlCDATA` annotation',
        () {
          final generator = builderGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlCDATAElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlCDATABuilderGenerator>(),
          );

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.cdata(value);',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlCDATA` annotation but is not a field element',
        () {
          expect(
            () => builderGeneratorFactory(
              FakeClassElement(
                metadata: [
                  FakeXmlCDATAElementAnnotation(),
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
                element: FakeClassElement(
                  metadata: [
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ),
              ),
            ),
          );

          expect(
            generator,
            isA<XmlSerializableXmlElementBuilderGenerator>(),
          );

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
                element: FakeClassElement(
                  metadata: [
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ),
              ),
            ),
          );

          expect(
            generator,
            isA<XmlSerializableXmlElementBuilderGenerator>(),
          );

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
                element: FakeClassElement(
                  metadata: [
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ),
              ),
            ),
          );

          expect(
            generator,
            isA<XmlSerializableXmlElementBuilderGenerator>(),
          );

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
                element: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableElementAnnotation(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          expect(
            generator,
            isA<IterableBuilderGenerator>(),
          );

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
                element: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableElementAnnotation(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          expect(
            generator,
            isA<IterableBuilderGenerator>(),
          );

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
                element: FakeIterableClassElement(),
                isDartCoreIterable: true,
                typeArguments: [
                  FakeInterfaceType(
                    element: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableElementAnnotation(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          expect(
            generator,
            isA<IterableBuilderGenerator>(),
          );

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

          expect(
            generator,
            isA<XmlTextXmlElementBuilderGenerator>(),
          );

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

          expect(
            generator,
            isA<XmlTextXmlElementBuilderGenerator>(),
          );

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

          expect(
            generator,
            isA<XmlTextXmlElementBuilderGenerator>(),
          );

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
            isA<IterableBuilderGenerator>(),
          );

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
            isA<IterableBuilderGenerator>(),
          );

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
            isA<IterableBuilderGenerator>(),
          );

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

          expect(
            generator,
            isA<XmlRootElementBuilderGenerator>(),
          );

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

          expect(
            generator,
            isA<XmlRootElementBuilderGenerator>(),
          );

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

          expect(
            generator,
            isA<XmlRootElementBuilderGenerator>(),
          );

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

          expect(
            generator,
            isA<XmlTextBuilderGenerator>(),
          );

          expect(
            generator.generateBuilder('value'),
            equals(
              'builder.text(value);',
            ),
          );
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
