// ignore_for_file: deprecated_member_use_from_same_package

import 'package:test/test.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_dart_object.dart';
import '../fake_field_rename_dart_object.dart';
import '../fake_field_rename_enum_element.dart';
import '../fake_interface_type.dart';
import '../fake_xml_attribute_dart_object.dart';
import '../fake_xml_cdata_dart_object.dart';
import '../fake_xml_element_dart_object.dart';
import '../fake_xml_enum_dart_object.dart';
import '../fake_xml_root_element_dart_object.dart';
import '../fake_xml_serializable_dart_object.dart';
import '../fake_xml_text_dart_object.dart';
import '../fake_xml_value_dart_object.dart';

void main() {
  group(
    'DartObjectExtensions',
    () {
      group(
        'getBoolValue',
        () {
          final object = FakeDartObject(
            fields: {
              'value': FakeDartObject(
                value: true,
              ),
            },
          );

          test(
            'should return the value of the field if the field exists',
            () {
              expect(object.getBoolValue('value'), equals(true));
            },
          );

          test(
            'should return null if the field does not exist',
            () {
              expect(object.getBoolValue(''), isNull);
            },
          );
        },
      );

      group(
        'getDoubleValue',
        () {
          final object = FakeDartObject(
            fields: {
              'value': FakeDartObject(
                value: 1.0,
              ),
            },
          );

          test(
            'should return the value of the field if the field exists',
            () {
              expect(object.getDoubleValue('value'), equals(1.0));
            },
          );

          test(
            'should return null if the field does not exist',
            () {
              expect(object.getDoubleValue(''), isNull);
            },
          );
        },
      );

      group(
        'getIntValue',
        () {
          final object = FakeDartObject(
            fields: {
              'value': FakeDartObject(
                value: 1,
              ),
            },
          );

          test(
            'should return the value of the field if the field exists',
            () {
              expect(object.getIntValue('value'), equals(1));
            },
          );

          test(
            'should return null if the field does not exist',
            () {
              expect(object.getIntValue(''), isNull);
            },
          );
        },
      );

      group(
        'getStringValue',
        () {
          final object = FakeDartObject(
            fields: {
              'value': FakeDartObject(
                value: 'string',
              ),
            },
          );

          test(
            'should return the value of the field if the field exists',
            () {
              expect(object.getStringValue('value'), equals('string'));
            },
          );

          test(
            'should return null if the field does not exist',
            () {
              expect(object.getStringValue(''), isNull);
            },
          );
        },
      );

      group(
        'toFieldRenameValue',
        () {
          test(
            'should return a `FieldRename` if the object being represented is of type `FieldRename`',
            () {
              expect(
                FakeFieldRenameDartObject(
                  value: FieldRename.none,
                ).toFieldRenameValue(),
                FieldRename.none,
              );
            },
          );

          test(
            'should return null if the object being represented is not of type `FieldRename`',
            () {
              expect(
                FakeDartObject().toFieldRenameValue(),
                isNull,
              );
            },
          );

          test(
            'should return null if the object being represented is of type `FieldRename` with a value of null',
            () {
              expect(
                FakeDartObject(
                  type: FakeInterfaceType(
                    element: FakeFieldRenameEnumElement(),
                  ),
                ).toFieldRenameValue(),
                isNull,
              );
            },
          );
        },
      );

      group(
        'toXmlAttributeValue',
        () {
          test(
            'should return an `XmlAttribute` if the object being represented is of type `XmlAttribute`',
            () {
              expect(
                FakeXmlAttributeDartObject(
                  value: XmlAttribute(
                    name: 'HelloWorld',
                  ),
                ).toXmlAttributeValue(),
                predicate<XmlAttribute>(
                  (value) => value.name == 'HelloWorld',
                ),
              );
            },
          );

          test(
            'should return null if the object being represented is not of type `XmlAttribute`',
            () {
              expect(
                FakeDartObject().toXmlAttributeValue(),
                isNull,
              );
            },
          );
        },
      );

      group(
        'toXmlCDATAValue',
        () {
          test(
            'should return an `XmlCDATA` if the object being represented is of type `XmlCDATA`',
            () {
              expect(
                FakeXmlCDATADartObject().toXmlCDATAValue(),
                isA<XmlCDATA>(),
              );
            },
          );

          test(
            'should return null if the object being represented is not of type `XmlCDATA`',
            () {
              expect(
                FakeDartObject().toXmlCDATAValue(),
                isNull,
              );
            },
          );
        },
      );

      group(
        'toXmlElementValue',
        () {
          test(
            'should return an `XmlElement` if the object being represented is of type `XmlElement`',
            () {
              expect(
                FakeXmlElementDartObject(
                  value: XmlElement(
                    name: 'HelloWorld',
                  ),
                ).toXmlElementValue(),
                predicate<XmlElement>(
                  (value) => value.name == 'HelloWorld',
                ),
              );
            },
          );

          test(
            'should return null if the object being represented is not of type `XmlElement`',
            () {
              expect(
                FakeDartObject().toXmlElementValue(),
                isNull,
              );
            },
          );
        },
      );

      group(
        'toXmlEnumValue',
        () {
          test(
            'should return an `XmlEnum` if the object being represented is of type `XmlEnum`',
            () {
              expect(
                FakeXmlEnumDartObject(
                  value: XmlEnum(
                    fieldRename: FieldRename.none,
                  ),
                ).toXmlEnumValue(),
                predicate<XmlEnum>(
                  (value) => value.fieldRename == FieldRename.none,
                ),
              );
            },
          );

          test(
            'should return null if the object being represented is not of type `XmlEnum`',
            () {
              expect(
                FakeDartObject().toXmlEnumValue(),
                isNull,
              );
            },
          );
        },
      );

      group(
        'toXmlRootElementValue',
        () {
          test(
            'should return an `XmlRootElement` if the object being represented is of type `XmlRootElement`',
            () {
              expect(
                FakeXmlRootElementDartObject(
                  value: XmlRootElement(
                    name: 'HelloWorld',
                  ),
                ).toXmlRootElementValue(),
                predicate<XmlRootElement>(
                  (value) => value.name == 'HelloWorld',
                ),
              );
            },
          );

          test(
            'should return null if the object being represented is not of type `XmlRootElement`',
            () {
              expect(
                FakeDartObject().toXmlRootElementValue(),
                isNull,
              );
            },
          );
        },
      );

      group(
        'toXmlSerializableValue',
        () {
          test(
            'should return an `XmlSerializable` if the object being represented is of type `XmlSerializable`',
            () {
              expect(
                FakeXmlSerializableDartObject(
                  value: XmlSerializable(
                    fieldRename: FieldRename.none,
                  ),
                ).toXmlSerializableValue(),
                predicate<XmlSerializable>(
                  (value) => value.fieldRename == FieldRename.none,
                ),
              );
            },
          );

          test(
            'should return null if the object being represented is not of type `XmlSerializable`',
            () {
              expect(
                FakeDartObject().toXmlSerializableValue(),
                isNull,
              );
            },
          );
        },
      );

      group(
        'toXmlTextValue',
        () {
          test(
            'should return an `XmlText` if the object being represented is of type `XmlText`',
            () {
              expect(
                FakeXmlTextDartObject().toXmlTextValue(),
                isA<XmlText>(),
              );
            },
          );

          test(
            'should return null if the object being represented is not of type `XmlText`',
            () {
              expect(
                FakeDartObject().toXmlTextValue(),
                isNull,
              );
            },
          );
        },
      );

      group(
        'toXmlValueValue',
        () {
          test(
            'should return an `XmlValue` if the object being represented is of type `XmlValue`',
            () {
              expect(
                FakeXmlValueDartObject(
                  value: XmlValue('value'),
                ).toXmlValueValue(),
                predicate<XmlValue>(
                  (value) => value.value == 'value',
                ),
              );
            },
          );

          test(
            'should return null if the object being represented is not of type `XmlValue`',
            () {
              expect(
                FakeDartObject().toXmlValueValue(),
                isNull,
              );
            },
          );
        },
      );
    },
  );
}
