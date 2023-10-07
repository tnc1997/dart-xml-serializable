import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_element_annotation.dart';
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
        'isXmlAttribute',
        () {
          test(
            'should return true if the annotation represents the annotation `XmlAttribute`',
            () {
              expect(
                FakeXmlAttributeElementAnnotation().isXmlAttribute,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation does not represent the annotation `XmlAttribute`',
            () {
              expect(
                FakeElementAnnotation().isXmlAttribute,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isXmlCDATA',
        () {
          test(
            'should return true if the annotation represents the annotation `XmlCDATA`',
            () {
              expect(
                FakeXmlCDATAElementAnnotation().isXmlCDATA,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation does not represent the annotation `XmlCDATA`',
            () {
              expect(
                FakeElementAnnotation().isXmlCDATA,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isXmlElement',
        () {
          test(
            'should return true if the annotation represents the annotation `XmlElement`',
            () {
              expect(
                FakeXmlElementElementAnnotation().isXmlElement,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation does not represent the annotation `XmlElement`',
            () {
              expect(
                FakeElementAnnotation().isXmlElement,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isXmlEnum',
        () {
          test(
            'should return true if the annotation represents the annotation `XmlEnum`',
            () {
              expect(
                FakeXmlEnumElementAnnotation().isXmlEnum,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation does not represent the annotation `XmlEnum`',
            () {
              expect(
                FakeElementAnnotation().isXmlEnum,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'ixXmlRootElement',
        () {
          test(
            'should return true if the annotation represents the annotation `XmlRootElement`',
            () {
              expect(
                FakeXmlRootElementElementAnnotation().isXmlRootElement,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation does not represent the annotation `XmlRootElement`',
            () {
              expect(
                FakeElementAnnotation().isXmlRootElement,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isXmlSerializable',
        () {
          test(
            'should return true if the annotation represents the annotation `XmlSerializable`',
            () {
              expect(
                FakeXmlSerializableElementAnnotation().isXmlSerializable,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation does not represent the annotation `XmlSerializable`',
            () {
              expect(
                FakeElementAnnotation().isXmlSerializable,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isXmlText',
        () {
          test(
            'should return true if the annotation represents the annotation `XmlText`',
            () {
              expect(
                FakeXmlTextElementAnnotation().isXmlText,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation does not represent the annotation `XmlText`',
            () {
              expect(
                FakeElementAnnotation().isXmlText,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isXmlValue',
        () {
          test(
            'should return true if the annotation represents the annotation `XmlValue`',
            () {
              expect(
                FakeXmlValueElementAnnotation('value').isXmlValue,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation does not represent the annotation `XmlValue`',
            () {
              expect(
                FakeElementAnnotation().isXmlValue,
                isFalse,
              );
            },
          );
        },
      );
    },
  );
}
