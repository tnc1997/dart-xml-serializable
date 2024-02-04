import 'package:test/test.dart';
import 'package:xml_annotation/xml_annotation.dart';
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
            'should return the annotation if the element has a constructor based annotation of the form `@XmlAttribute`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlAttributeConstructorElementElementAnnotation(
                      value: XmlAttribute(),
                    ),
                  ],
                ).getXmlAttribute(),
                isNotNull,
              );
            },
          );

          test(
            'should return the annotation if the element has a property accessor based annotation of the form `@XmlAttribute`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlAttributePropertyAccessorElementElementAnnotation(
                      value: XmlAttribute(),
                    ),
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
            'should return the annotation if the element has a constructor based annotation of the form `@XmlCDATA`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlCDATAConstructorElementElementAnnotation(
                      value: XmlCDATA(),
                    ),
                  ],
                ).getXmlCDATA(),
                isNotNull,
              );
            },
          );

          test(
            'should return the annotation if the element has a property accessor based annotation of the form `@XmlCDATA`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlCDATAPropertyAccessorElementElementAnnotation(
                      value: XmlCDATA(),
                    ),
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
            'should return the annotation if the element has a constructor based annotation of the form `@XmlElement`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlElementConstructorElementElementAnnotation(
                      value: XmlElement(),
                    ),
                  ],
                ).getXmlElement(),
                isNotNull,
              );
            },
          );

          test(
            'should return the annotation if the element has a property accessor based annotation of the form `@XmlElement`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlElementPropertyAccessorElementElementAnnotation(
                      value: XmlElement(),
                    ),
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
            'should return the annotation if the element has a constructor based annotation of the form `@XmlEnum`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlEnumConstructorElementElementAnnotation(
                      value: XmlEnum(),
                    ),
                  ],
                ).getXmlEnum(),
                isNotNull,
              );
            },
          );

          test(
            'should return the annotation if the element has a property accessor based annotation of the form `@XmlEnum`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlEnumPropertyAccessorElementElementAnnotation(
                      value: XmlEnum(),
                    ),
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
            'should return the annotation if the element has a constructor based annotation of the form `@XmlRootElement`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlRootElementConstructorElementElementAnnotation(
                      value: XmlRootElement(),
                    ),
                  ],
                ).getXmlRootElement(),
                isNotNull,
              );
            },
          );

          test(
            'should return the annotation if the element has a property accessor based annotation of the form `@XmlRootElement`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlRootElementPropertyAccessorElementElementAnnotation(
                      value: XmlRootElement(),
                    ),
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
            'should return the annotation if the element has a constructor based annotation of the form `@XmlSerializable`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlSerializableConstructorElementElementAnnotation(
                      value: XmlSerializable(),
                    ),
                  ],
                ).getXmlSerializable(),
                isNotNull,
              );
            },
          );

          test(
            'should return the annotation if the element has a property accessor based annotation of the form `@XmlSerializable`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlSerializablePropertyAccessorElementElementAnnotation(
                      value: XmlSerializable(),
                    ),
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
            'should return the annotation if the element has a constructor based annotation of the form `@XmlText`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlTextConstructorElementElementAnnotation(
                      value: XmlText(),
                    ),
                  ],
                ).getXmlText(),
                isNotNull,
              );
            },
          );

          test(
            'should return the annotation if the element has a property accessor based annotation of the form `@XmlText`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlTextPropertyAccessorElementElementAnnotation(
                      value: XmlText(),
                    ),
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
            'should return true if the element has a constructor based annotation of the form `@XmlAttribute()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlAttributeConstructorElementElementAnnotation(
                      value: XmlAttribute(),
                    ),
                  ],
                ).hasXmlAttribute,
                isTrue,
              );
            },
          );

          test(
            'should return true if the element has a property accessor based annotation of the form `@XmlAttribute()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlAttributePropertyAccessorElementElementAnnotation(
                      value: XmlAttribute(),
                    ),
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
            'should return true if the element has a constructor based annotation of the form `@XmlCDATA()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlCDATAConstructorElementElementAnnotation(
                      value: XmlCDATA(),
                    ),
                  ],
                ).hasXmlCDATA,
                isTrue,
              );
            },
          );

          test(
            'should return true if the element has a property accessor based annotation of the form `@XmlCDATA()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlCDATAPropertyAccessorElementElementAnnotation(
                      value: XmlCDATA(),
                    ),
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
            'should return true if the element has a constructor based annotation of the form `@XmlElement()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlElementConstructorElementElementAnnotation(
                      value: XmlElement(),
                    ),
                  ],
                ).hasXmlElement,
                isTrue,
              );
            },
          );

          test(
            'should return true if the element has a property accessor based annotation of the form `@XmlElement()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlElementPropertyAccessorElementElementAnnotation(
                      value: XmlElement(),
                    ),
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
            'should return true if the element has a constructor based annotation of the form `@XmlEnum()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlEnumConstructorElementElementAnnotation(
                      value: XmlEnum(),
                    ),
                  ],
                ).hasXmlEnum,
                isTrue,
              );
            },
          );

          test(
            'should return true if the element has a property accessor based annotation of the form `@XmlEnum()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlEnumPropertyAccessorElementElementAnnotation(
                      value: XmlEnum(),
                    ),
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
            'should return true if the element has a constructor based annotation of the form `@XmlRootElement()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlRootElementConstructorElementElementAnnotation(
                      value: XmlRootElement(),
                    ),
                  ],
                ).hasXmlRootElement,
                isTrue,
              );
            },
          );

          test(
            'should return true if the element has a property accessor based annotation of the form `@XmlRootElement()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlRootElementPropertyAccessorElementElementAnnotation(
                      value: XmlRootElement(),
                    ),
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
            'should return true if the element has a constructor based annotation of the form `@XmlSerializable()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlSerializableConstructorElementElementAnnotation(
                      value: XmlSerializable(),
                    ),
                  ],
                ).hasXmlSerializable,
                isTrue,
              );
            },
          );

          test(
            'should return true if the element has a property accessor based annotation of the form `@XmlSerializable()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlSerializablePropertyAccessorElementElementAnnotation(
                      value: XmlSerializable(),
                    ),
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
            'should return true if the element has a constructor based annotation of the form `@XmlText()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlTextConstructorElementElementAnnotation(
                      value: XmlText(),
                    ),
                  ],
                ).hasXmlText,
                isTrue,
              );
            },
          );

          test(
            'should return true if the element has a property accessor based annotation of the form `@XmlText()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlTextPropertyAccessorElementElementAnnotation(
                      value: XmlText(),
                    ),
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
            'should return true if the element has a constructor based annotation of the form `@XmlValue()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlValueConstructorElementElementAnnotation(
                      value: XmlValue('value'),
                    ),
                  ],
                ).hasXmlValue,
                isTrue,
              );
            },
          );

          test(
            'should return true if the element has a property accessor based annotation of the form `@XmlValue()`',
            () {
              expect(
                FakeFieldElement(
                  metadata: [
                    FakeXmlValuePropertyAccessorElementElementAnnotation(
                      value: XmlValue('value'),
                    ),
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
