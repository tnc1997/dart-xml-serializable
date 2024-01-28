import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_date_time_class_element.dart';
import '../fake_duration_class_element.dart';
import '../fake_dynamic_type.dart';
import '../fake_int_class_element.dart';
import '../fake_interface_type.dart';
import '../fake_string_class_element.dart';
import '../fake_uri_class_element.dart';
import '../fake_xml_converter_class_element.dart';

void main() {
  group(
    'DartTypeExtensions',
    () {
      group(
        'isDartCore',
        () {
          test(
            'should return true if the type is a type defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType(
                  element: FakeStringClassElement(),
                  isDartCoreString: true,
                ).isDartCore,
                isTrue,
              );
            },
          );

          test(
            'should return false if the type is not a type defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType().isDartCore,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isDartCoreDateTime',
        () {
          test(
            'should return true if the type is the type `DateTime` defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType(
                  element: FakeDateTimeClassElement(),
                ).isDartCoreDateTime,
                isTrue,
              );
            },
          );

          test(
            'should return false if the type is not the type `DateTime` defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType().isDartCoreDateTime,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isDartCoreDuration',
        () {
          test(
            'should return true if the type is the type `Duration` defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType(
                  element: FakeDurationClassElement(),
                ).isDartCoreDuration,
                isTrue,
              );
            },
          );

          test(
            'should return false if the type is not the type `Duration` defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType().isDartCoreDuration,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isDartCoreUri',
        () {
          test(
            'should return true if the type is the type `Uri` defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType(
                  element: FakeUriClassElement(),
                ).isDartCoreUri,
                isTrue,
              );
            },
          );

          test(
            'should return false if the type is not the type `Uri` defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType().isDartCoreUri,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isNullable',
        () {
          test(
            'should return true if the type is dynamic',
            () {
              expect(
                FakeDynamicType().isNullable,
                isTrue,
              );
            },
          );

          test(
            'should return true if the type is nullable',
            () {
              expect(
                FakeInterfaceType(
                  nullabilitySuffix: NullabilitySuffix.question,
                ).isNullable,
                isTrue,
              );
            },
          );

          test(
            'should return false if the type is not dynamic nor is nullable',
            () {
              expect(
                FakeInterfaceType(
                  nullabilitySuffix: NullabilitySuffix.none,
                ).isNullable,
                isFalse,
              );
            },
          );
        },
      );

      group(
        'isXmlAnnotationXmlConverter',
        () {
          test(
            'should return true if the type implements the type `XmlConverter` defined in the xml_annotation library',
            () {
              expect(
                FakeInterfaceType(
                  allSupertypes: [
                    FakeInterfaceType(
                      element: FakeXmlConverterClassElement(),
                    ),
                  ],
                ).isXmlAnnotationXmlConverter(),
                isTrue,
              );
            },
          );

          test(
            'should return true if the type implements the type `XmlConverter` defined in the xml_annotation library and can convert the type',
            () {
              expect(
                FakeInterfaceType(
                  allSupertypes: [
                    FakeInterfaceType(
                      element: FakeXmlConverterClassElement(),
                      typeArguments: [
                        FakeInterfaceType(
                          element: FakeStringClassElement(),
                        ),
                      ],
                    ),
                  ],
                ).isXmlAnnotationXmlConverter(
                  type: FakeInterfaceType(
                    element: FakeStringClassElement(),
                  ),
                ),
                isTrue,
              );
            },
          );

          test(
            'should return false if the type does not implement the type `XmlConverter` defined in the xml_annotation library',
            () {
              expect(
                FakeInterfaceType().isXmlAnnotationXmlConverter(),
                isFalse,
              );
            },
          );

          test(
            'should return false if the type cannot convert the type',
            () {
              expect(
                FakeInterfaceType(
                  allSupertypes: [
                    FakeInterfaceType(
                      element: FakeXmlConverterClassElement(),
                      typeArguments: [
                        FakeInterfaceType(
                          element: FakeIntClassElement(),
                        ),
                      ],
                    ),
                  ],
                ).isXmlAnnotationXmlConverter(
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
    },
  );
}
