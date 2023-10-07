import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_field_element.dart';
import '../fake_xml_attribute_element_annotation.dart';
import '../fake_xml_cdata_element_annotation.dart';
import '../fake_xml_element_element_annotation.dart';
import '../fake_xml_enum_element_annotation.dart';
import '../fake_xml_root_element_element_annotation.dart';
import '../fake_xml_serializable_element_annotation.dart';
import '../fake_xml_text_element_annotation.dart';
import '../fake_xml_value_element_annotation.dart';

void main() {
  group(
    'ElementAnnotationExtensions',
    () {
      group(
        'getXmlAttribute',
        () {
          test(
            'should return the annotation if the element has an annotation of the form `@XmlAttribute`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlAttributeElementAnnotation(),
                  ],
                ).getXmlAttribute(),
                isNotNull,
              );
            },
          );

          test(
            'should throw a `StateError` if the element does not have an annotation of the form `@XmlAttribute`',
            () {
              expect(
                () => FakeFieldElement().getXmlAttribute(),
                throwsA(isA<StateError>()),
              );
            },
          );
        },
      );

      group(
        'getXmlCDATA',
        () {
          test(
            'should return the annotation if the element has an annotation of the form `@XmlCDATA`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlCDATAElementAnnotation(),
                  ],
                ).getXmlCDATA(),
                isNotNull,
              );
            },
          );

          test(
            'should throw a `StateError` if the element does not have an annotation of the form `@XmlCDATA`',
            () {
              expect(
                () => FakeFieldElement().getXmlCDATA(),
                throwsA(isA<StateError>()),
              );
            },
          );
        },
      );

      group(
        'getXmlElement',
        () {
          test(
            'should return the annotation if the element has an annotation of the form `@XmlElement`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlElementElementAnnotation(),
                  ],
                ).getXmlElement(),
                isNotNull,
              );
            },
          );

          test(
            'should throw a `StateError` if the element does not have an annotation of the form `@XmlElement`',
            () {
              expect(
                () => FakeFieldElement().getXmlElement(),
                throwsA(isA<StateError>()),
              );
            },
          );
        },
      );

      group(
        'getXmlEnum',
        () {
          test(
            'should return the annotation if the element has an annotation of the form `@XmlEnum`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlEnumElementAnnotation(),
                  ],
                ).getXmlEnum(),
                isNotNull,
              );
            },
          );

          test(
            'should throw a `StateError` if the element does not have an annotation of the form `@XmlEnum`',
            () {
              expect(
                () => FakeFieldElement().getXmlEnum(),
                throwsA(isA<StateError>()),
              );
            },
          );
        },
      );

      group(
        'getXmlRootElement',
        () {
          test(
            'should return the annotation if the element has an annotation of the form `@XmlRootElement`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlRootElementElementAnnotation(),
                  ],
                ).getXmlRootElement(),
                isNotNull,
              );
            },
          );

          test(
            'should throw a `StateError` if the element does not have an annotation of the form `@XmlRootElement`',
            () {
              expect(
                () => FakeFieldElement().getXmlRootElement(),
                throwsA(isA<StateError>()),
              );
            },
          );
        },
      );

      group(
        'getXmlSerializable',
        () {
          test(
            'should return the annotation if the element has an annotation of the form `@XmlSerializable`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ).getXmlSerializable(),
                isNotNull,
              );
            },
          );

          test(
            'should throw a `StateError` if the element does not have an annotation of the form `@XmlSerializable`',
            () {
              expect(
                () => FakeFieldElement().getXmlSerializable(),
                throwsA(isA<StateError>()),
              );
            },
          );
        },
      );

      group(
        'getXmlText',
        () {
          test(
            'should return the annotation if the element has an annotation of the form `@XmlText`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlTextElementAnnotation(),
                  ],
                ).getXmlText(),
                isNotNull,
              );
            },
          );

          test(
            'should throw a `StateError` if the element does not have an annotation of the form `@XmlText`',
            () {
              expect(
                () => FakeFieldElement().getXmlText(),
                throwsA(isA<StateError>()),
              );
            },
          );
        },
      );

      group(
        'hasXmlAttribute',
        () {
          test(
            'should return true if the element has an annotation of the form `@XmlAttribute()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlAttributeElementAnnotation(),
                  ],
                ).hasXmlAttribute,
                isTrue,
              );
            },
          );

          test(
            'should return false if the element does not have an annotation of the form `@XmlAttribute()`',
            () {
              expect(
                FakeFieldElement().hasXmlAttribute,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'hasXmlCDATA',
        () {
          test(
            'should return true if the element has an annotation of the form `@XmlCDATA()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlCDATAElementAnnotation(),
                  ],
                ).hasXmlCDATA,
                isTrue,
              );
            },
          );

          test(
            'should return false if the element does not have an annotation of the form `@XmlCDATA()`',
            () {
              expect(
                FakeFieldElement().hasXmlCDATA,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'hasXmlElement',
        () {
          test(
            'should return true if the element has an annotation of the form `@XmlElement()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlElementElementAnnotation(),
                  ],
                ).hasXmlElement,
                isTrue,
              );
            },
          );

          test(
            'should return false if the element does not have an annotation of the form `@XmlElement()`',
            () {
              expect(
                FakeFieldElement().hasXmlElement,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'hasXmlEnum',
        () {
          test(
            'should return true if the element has an annotation of the form `@XmlEnum()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlEnumElementAnnotation(),
                  ],
                ).hasXmlEnum,
                isTrue,
              );
            },
          );

          test(
            'should return false if the element does not have an annotation of the form `@XmlEnum()`',
            () {
              expect(
                FakeFieldElement().hasXmlEnum,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'hasXmlRootElement',
        () {
          test(
            'should return true if the element has an annotation of the form `@XmlRootElement()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlRootElementElementAnnotation(),
                  ],
                ).hasXmlRootElement,
                isTrue,
              );
            },
          );

          test(
            'should return false if the element does not have an annotation of the form `@XmlRootElement()`',
            () {
              expect(
                FakeFieldElement().hasXmlRootElement,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'hasXmlSerializable',
        () {
          test(
            'should return true if the element has an annotation of the form `@XmlSerializable()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ).hasXmlSerializable,
                isTrue,
              );
            },
          );

          test(
            'should return false if the element does not have an annotation of the form `@XmlSerializable()`',
            () {
              expect(
                FakeFieldElement().hasXmlSerializable,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'hasXmlText',
        () {
          test(
            'should return true if the element has an annotation of the form `@XmlText()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlTextElementAnnotation(),
                  ],
                ).hasXmlText,
                isTrue,
              );
            },
          );

          test(
            'should return false if the element does not have an annotation of the form `@XmlText()`',
            () {
              expect(
                FakeFieldElement().hasXmlText,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'hasXmlValue',
        () {
          test(
            'should return true if the element has an annotation of the form `@XmlValue()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlValueElementAnnotation('value'),
                  ],
                ).hasXmlValue,
                isTrue,
              );
            },
          );

          test(
            'should return false if the element does not have an annotation of the form `@XmlValue()`',
            () {
              expect(
                FakeFieldElement().hasXmlValue,
                isFalse,
              );
            },
          );
        },
      );
    },
  );
}
