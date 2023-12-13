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
import '../fake_xml_serializable_element_annotation.dart';
import '../fake_xml_text_element_annotation.dart';

void main() {
  group(
    'GetterGeneratorFactory',
    () {
      test(
        'should create an `XmlAttributeGetterGenerator` with the field name if the field element has an `XmlAttribute` annotation without a name',
        () {
          final generator = getterGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlAttributeElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlAttributeGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals('element.getAttribute(\'value\')!'),
          );
        },
      );

      test(
        'should create an `XmlAttributeGetterGenerator` with the `XmlAttribute` name if the field element has an `XmlAttribute` annotation with a name',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlAttributeGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals('element.getAttribute(\'name\')!'),
          );
        },
      );

      test(
        'should create an `XmlAttributeGetterGenerator` with the `XmlAttribute` name and namespace if the field element has an `XmlAttribute` annotation with a name and namespace',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlAttributeGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals(
              'element.getAttribute(\'name\', namespace: \'https://www.example.com\')!',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlAttribute` annotation but is not a field element',
        () {
          expect(
            () => getterGeneratorFactory(
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
        'should create an `XmlCDATAGetterGenerator` if the field element has an `XmlCDATA` annotation',
        () {
          final generator = getterGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlCDATAElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlCDATAGetterGenerator>(),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlCDATA` annotation but is not a field element',
        () {
          expect(
            () => getterGeneratorFactory(
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
        'should create an `XmlSerializableXmlElementGetterGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlSerializableXmlElementGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals('element.getElement(\'value\')!'),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementGetterGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlSerializableXmlElementGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals('element.getElement(\'name\')!'),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementGetterGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlSerializableXmlElementGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals(
              'element.getElement(\'name\', namespace: \'https://www.example.com\')!',
            ),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementIterableGetterGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlSerializableXmlElementIterableGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals('element.getElements(\'value\')!'),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementIterableGetterGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlSerializableXmlElementIterableGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals('element.getElements(\'name\')!'),
          );
        },
      );

      test(
        'should create an `XmlSerializableXmlElementIterableGetterGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlSerializableXmlElementIterableGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals(
              'element.getElements(\'name\', namespace: \'https://www.example.com\')!',
            ),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementGetterGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = getterGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlElementElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlTextXmlElementGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals('element.getElement(\'value\')!.getText()!'),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementGetterGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlTextXmlElementGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals('element.getElement(\'name\')!.getText()!'),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementGetterGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlTextXmlElementGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals(
              'element.getElement(\'name\', namespace: \'https://www.example.com\')!.getText()!',
            ),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementIterableGetterGenerator` with the field name if the field element has an `XmlElement` annotation without a name',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlTextXmlElementIterableGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals(
              'element.getElements(\'value\')!.map((e) => e.getText()).whereType<String>()',
            ),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementIterableGetterGenerator` with the `XmlElement` name if the field element has an `XmlElement` annotation with a name',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlTextXmlElementIterableGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals(
              'element.getElements(\'name\')!.map((e) => e.getText()).whereType<String>()',
            ),
          );
        },
      );

      test(
        'should create an `XmlTextXmlElementIterableGetterGenerator` with the `XmlElement` name and namespace if the field element has an `XmlElement` annotation with a name and namespace',
        () {
          final generator = getterGeneratorFactory(
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
            isA<XmlTextXmlElementIterableGetterGenerator>(),
          );

          expect(
            generator.generateGetter('element'),
            equals(
              'element.getElements(\'name\', namespace: \'https://www.example.com\')!.map((e) => e.getText()).whereType<String>()',
            ),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlElement` annotation but is not a field element',
        () {
          expect(
            () => getterGeneratorFactory(
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
        'should create an `XmlTextGetterGenerator` if the field element has an `XmlText` annotation',
        () {
          final generator = getterGeneratorFactory(
            FakeFieldElement(
              metadata: [
                FakeXmlTextElementAnnotation(),
              ],
              name: 'value',
            ),
          );

          expect(
            generator,
            isA<XmlTextGetterGenerator>(),
          );
        },
      );

      test(
        'should throw an argument error if the element has an `XmlText` annotation but is not a field element',
        () {
          expect(
            () => getterGeneratorFactory(
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
        'should throw an argument error if the field element is unsupported',
        () {
          expect(
            () => getterGeneratorFactory(
              FakeFieldElement(),
            ),
            throwsA(isA<ArgumentError>()),
          );
        },
      );
    },
  );
}
