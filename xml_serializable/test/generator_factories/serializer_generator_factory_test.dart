import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_bool_class_element.dart';
import '../fake_date_time_class_element.dart';
import '../fake_double_class_element.dart';
import '../fake_duration_class_element.dart';
import '../fake_dynamic_class_element.dart';
import '../fake_int_class_element.dart';
import '../fake_interface_type.dart';
import '../fake_iterable_class_element.dart';
import '../fake_list_class_element.dart';
import '../fake_num_class_element.dart';
import '../fake_set_class_element.dart';
import '../fake_string_class_element.dart';
import '../fake_uri_class_element.dart';

void main() {
  group(
    'SerializerGeneratorFactory',
    () {
      test(
        'should create a `BoolSerializerGenerator` if the type is `bool`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeBoolClassElement(),
                isDartCoreBool: true,
              ),
            ),
            isA<BoolSerializerGenerator>(),
          );
        },
      );

      test(
        'should create a `DateTimeSerializerGenerator` if the type is `DateTime`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeDateTimeClassElement(),
              ),
            ),
            isA<DateTimeSerializerGenerator>(),
          );
        },
      );

      test(
        'should create a `DoubleSerializerGenerator` if the type is `double`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeDoubleClassElement(),
                isDartCoreDouble: true,
              ),
            ),
            isA<DoubleSerializerGenerator>(),
          );
        },
      );

      test(
        'should create a `DurationSerializerGenerator` if the type is `Duration`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeDurationClassElement(),
              ),
            ),
            isA<DurationSerializerGenerator>(),
          );
        },
      );

      test(
        'should create a `DynamicSerializerGenerator` if the type is `dynamic`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeDynamicClassElement(),
                isDynamic: true,
              ),
            ),
            isA<DynamicSerializerGenerator>(),
          );
        },
      );

      test(
        'should create an `IntSerializerGenerator` if the type is `int`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeIntClassElement(),
                isDartCoreInt: true,
              ),
            ),
            isA<IntSerializerGenerator>(),
          );
        },
      );

      test(
        'should create an `IterableSerializerGenerator` if the type is `Iterable`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
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
            isA<IterableSerializerGenerator>(),
          );
        },
      );

      test(
        'should create a `ListSerializerGenerator` if the type is `List`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeListClassElement(),
                isDartCoreList: true,
                typeArguments: [
                  FakeInterfaceType(
                    element2: FakeStringClassElement(),
                    isDartCoreString: true,
                  ),
                ],
              ),
            ),
            isA<ListSerializerGenerator>(),
          );
        },
      );

      test(
        'should create a `NumSerializerGenerator` if the type is `num`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeNumClassElement(),
                isDartCoreNum: true,
              ),
            ),
            isA<NumSerializerGenerator>(),
          );
        },
      );

      test(
        'should create a `SetSerializerGenerator` if the type is `Set`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeSetClassElement(),
                isDartCoreSet: true,
                typeArguments: [
                  FakeInterfaceType(
                    element2: FakeStringClassElement(),
                    isDartCoreString: true,
                  ),
                ],
              ),
            ),
            isA<SetSerializerGenerator>(),
          );
        },
      );

      test(
        'should create a `StringSerializerGenerator` if the type is `String`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeStringClassElement(),
                isDartCoreString: true,
              ),
            ),
            isA<StringSerializerGenerator>(),
          );
        },
      );

      test(
        'should create a `UriSerializerGenerator` if the type is `Uri`',
        () {
          expect(
            serializerGeneratorFactory(
              FakeInterfaceType(
                element2: FakeUriClassElement(),
              ),
            ),
            isA<UriSerializerGenerator>(),
          );
        },
      );

      test(
        'should throw an argument error if the type is not supported',
        () {
          expect(
            () => serializerGeneratorFactory(
              FakeInterfaceType(),
            ),
            throwsA(isA<ArgumentError>()),
          );
        },
      );
    },
  );
}
