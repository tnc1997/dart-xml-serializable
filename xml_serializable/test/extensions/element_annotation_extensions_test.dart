import 'package:test/test.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_class_element.dart';
import '../fake_constructor_element_element_annotation.dart';
import '../fake_int_class_element.dart';
import '../fake_interface_type.dart';
import '../fake_property_accessor_element_element_annotation.dart';
import '../fake_string_class_element.dart';
import '../fake_xml_attribute_element_annotation.dart';
import '../fake_xml_cdata_element_annotation.dart';
import '../fake_xml_converter_class_element.dart';
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
            'should return true if the annotation is constructor based and represents the annotation `XmlAttribute`',
            () {
              expect(
                FakeXmlAttributeConstructorElementElementAnnotation(
                  value: XmlAttribute(),
                ).isXmlAttribute,
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and represents the annotation `XmlAttribute`',
            () {
              expect(
                FakeXmlAttributePropertyAccessorElementElementAnnotation(
                  value: XmlAttribute(),
                ).isXmlAttribute,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and does not represent the annotation `XmlAttribute`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(),
                ).isXmlAttribute,
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and does not represent the annotation `XmlAttribute`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(),
                ).isXmlAttribute,
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
            'should return true if the annotation is constructor based and represents the annotation `XmlCDATA`',
            () {
              expect(
                FakeXmlCDATAConstructorElementElementAnnotation(
                  value: XmlCDATA(),
                ).isXmlCDATA,
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and represents the annotation `XmlCDATA`',
            () {
              expect(
                FakeXmlCDATAPropertyAccessorElementElementAnnotation(
                  value: XmlCDATA(),
                ).isXmlCDATA,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and does not represent the annotation `XmlCDATA`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(),
                ).isXmlCDATA,
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and does not represent the annotation `XmlCDATA`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(),
                ).isXmlCDATA,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isXmlConverter',
        () {
          test(
            'should return true if the annotation is constructor based and implements the type `XmlConverter`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(
                    thisType: FakeInterfaceType(
                      interfaces: [
                        FakeInterfaceType(
                          element: FakeXmlConverterClassElement(),
                        ),
                      ],
                    ),
                  ),
                ).isXmlConverter(),
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is constructor based and implements the type `XmlConverter` and can convert the type',
            () {
              final element = FakeStringClassElement();

              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(
                    thisType: FakeInterfaceType(
                      interfaces: [
                        FakeInterfaceType(
                          element: FakeXmlConverterClassElement(),
                          typeArguments: [
                            FakeInterfaceType(
                              element: element,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).isXmlConverter(
                  type: FakeInterfaceType(
                    element: element,
                  ),
                ),
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and implements the type `XmlConverter`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(
                    interfaces: [
                      FakeInterfaceType(
                        element: FakeXmlConverterClassElement(),
                      ),
                    ],
                  ),
                ).isXmlConverter(),
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and implements the type `XmlConverter` and can convert the type',
            () {
              final element = FakeStringClassElement();

              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(
                    interfaces: [
                      FakeInterfaceType(
                        element: FakeXmlConverterClassElement(),
                        typeArguments: [
                          FakeInterfaceType(
                            element: element,
                          ),
                        ],
                      ),
                    ],
                  ),
                ).isXmlConverter(
                  type: FakeInterfaceType(
                    element: element,
                  ),
                ),
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and does not implement the type `XmlConverter`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(),
                ).isXmlConverter(),
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and cannot convert the type',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(
                    thisType: FakeInterfaceType(
                      interfaces: [
                        FakeInterfaceType(
                          element: FakeXmlConverterClassElement(),
                          typeArguments: [
                            FakeInterfaceType(
                              element: FakeIntClassElement(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).isXmlConverter(
                  type: FakeInterfaceType(
                    element: FakeStringClassElement(),
                  ),
                ),
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and does not implement the type `XmlConverter`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(),
                ).isXmlConverter(),
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and cannot convert the type',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(
                    interfaces: [
                      FakeInterfaceType(
                        element: FakeXmlConverterClassElement(),
                        typeArguments: [
                          FakeInterfaceType(
                            element: FakeIntClassElement(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).isXmlConverter(
                  type: FakeInterfaceType(
                    element: FakeStringClassElement(),
                  ),
                ),
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
            'should return true if the annotation is constructor based and represents the annotation `XmlElement`',
            () {
              expect(
                FakeXmlElementConstructorElementElementAnnotation(
                  value: XmlElement(),
                ).isXmlElement,
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and represents the annotation `XmlElement`',
            () {
              expect(
                FakeXmlElementPropertyAccessorElementElementAnnotation(
                  value: XmlElement(),
                ).isXmlElement,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and does not represent the annotation `XmlElement`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(),
                ).isXmlElement,
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and does not represent the annotation `XmlElement`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(),
                ).isXmlElement,
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
            'should return true if the annotation is constructor based and represents the annotation `XmlEnum`',
            () {
              expect(
                FakeXmlEnumConstructorElementElementAnnotation(
                  value: XmlEnum(),
                ).isXmlEnum,
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and represents the annotation `XmlEnum`',
            () {
              expect(
                FakeXmlEnumPropertyAccessorElementElementAnnotation(
                  value: XmlEnum(),
                ).isXmlEnum,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and does not represent the annotation `XmlEnum`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(),
                ).isXmlEnum,
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and does not represent the annotation `XmlEnum`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(),
                ).isXmlEnum,
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
            'should return true if the annotation is constructor based and represents the annotation `XmlRootElement`',
            () {
              expect(
                FakeXmlRootElementConstructorElementElementAnnotation(
                  value: XmlRootElement(),
                ).isXmlRootElement,
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and represents the annotation `XmlRootElement`',
            () {
              expect(
                FakeXmlRootElementPropertyAccessorElementElementAnnotation(
                  value: XmlRootElement(),
                ).isXmlRootElement,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and does not represent the annotation `XmlRootElement`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(),
                ).isXmlRootElement,
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and does not represent the annotation `XmlRootElement`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(),
                ).isXmlRootElement,
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
            'should return true if the annotation is constructor based and represents the annotation `XmlSerializable`',
            () {
              expect(
                FakeXmlSerializableConstructorElementElementAnnotation(
                  value: XmlSerializable(),
                ).isXmlSerializable,
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and represents the annotation `XmlSerializable`',
            () {
              expect(
                FakeXmlSerializablePropertyAccessorElementElementAnnotation(
                  value: XmlSerializable(),
                ).isXmlSerializable,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and does not represent the annotation `XmlSerializable`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(),
                ).isXmlSerializable,
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and does not represent the annotation `XmlSerializable`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(),
                ).isXmlSerializable,
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
            'should return true if the annotation is constructor based and represents the annotation `XmlText`',
            () {
              expect(
                FakeXmlTextConstructorElementElementAnnotation(
                  value: XmlText(),
                ).isXmlText,
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and represents the annotation `XmlText`',
            () {
              expect(
                FakeXmlTextPropertyAccessorElementElementAnnotation(
                  value: XmlText(),
                ).isXmlText,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and does not represent the annotation `XmlText`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(),
                ).isXmlText,
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and does not represent the annotation `XmlText`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(),
                ).isXmlText,
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
            'should return true if the annotation is constructor based and represents the annotation `XmlValue`',
            () {
              expect(
                FakeXmlValueConstructorElementElementAnnotation(
                  value: XmlValue('value'),
                ).isXmlValue,
                isTrue,
              );
            },
          );

          test(
            'should return true if the annotation is property accessor based and represents the annotation `XmlValue`',
            () {
              expect(
                FakeXmlValuePropertyAccessorElementElementAnnotation(
                  value: XmlValue('value'),
                ).isXmlValue,
                isTrue,
              );
            },
          );

          test(
            'should return false if the annotation is constructor based and does not represent the annotation `XmlValue`',
            () {
              expect(
                FakeConstructorElementElementAnnotation(
                  enclosingElement3: FakeClassElement(),
                ).isXmlValue,
                isFalse,
              );
            },
          );

          test(
            'should return false if the annotation is property accessor based and does not represent the annotation `XmlValue`',
            () {
              expect(
                FakePropertyAccessorElementElementAnnotation(
                  returnType: FakeInterfaceType(),
                ).isXmlValue,
                isFalse,
              );
            },
          );
        },
      );
    },
  );
}
