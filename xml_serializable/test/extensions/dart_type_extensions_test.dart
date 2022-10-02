import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_class_element.dart';
import '../fake_date_time_class_element.dart';
import '../fake_duration_class_element.dart';
import '../fake_dynamic_class_element.dart';
import '../fake_interface_type.dart';
import '../fake_string_class_element.dart';
import '../fake_uri_class_element.dart';

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
                  element2: FakeStringClassElement(),
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
                FakeInterfaceType(
                  element2: FakeClassElement(),
                ).isDartCore,
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
                  element2: FakeDateTimeClassElement(),
                ).isDartCoreDateTime,
                isTrue,
              );
            },
          );

          test(
            'should return false if the type is not the type `DateTime` defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType(
                  element2: FakeClassElement(),
                ).isDartCoreDateTime,
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
                  element2: FakeDurationClassElement(),
                ).isDartCoreDuration,
                isTrue,
              );
            },
          );

          test(
            'should return false if the type is not the type `Duration` defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType(
                  element2: FakeClassElement(),
                ).isDartCoreDuration,
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
                  element2: FakeUriClassElement(),
                ).isDartCoreUri,
                isTrue,
              );
            },
          );

          test(
            'should return false if the type is not the type `Uri` defined in the dart:core library',
            () {
              expect(
                FakeInterfaceType(
                  element2: FakeClassElement(),
                ).isDartCoreUri,
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
                FakeInterfaceType(
                  element2: FakeDynamicClassElement(),
                  isDynamic: true,
                ).isNullable,
                isTrue,
              );
            },
          );

          test(
            'should return true if the type is nullable',
            () {
              expect(
                FakeInterfaceType(
                  element2: FakeClassElement(),
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
                  element2: FakeClassElement(),
                  nullabilitySuffix: NullabilitySuffix.none,
                ).isNullable,
                isFalse,
              );
            },
          );
        },
      );
    },
  );
}
