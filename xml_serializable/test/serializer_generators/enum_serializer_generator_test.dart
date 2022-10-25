import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'EnumSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                EnumSerializerGenerator('FooBar').generateSerializer('value'),
                equals(
                  '_\$FooBarEnumMap[value]!',
                ),
              );
            },
          );

          test(
            'should generate a null-aware serializer if constructed with a nullable type',
            () {
              expect(
                NullableEnumSerializerGenerator('FooBar')
                    .generateSerializer('value'),
                equals(
                  'value != null ? _\$FooBarEnumMap[value]! : null',
                ),
              );
            },
          );
        },
      );

      group(
        'generateDeserializer',
        () {
          test(
            'should generate a deserializer if constructed with a type',
            () {
              expect(
                EnumSerializerGenerator('FooBar').generateDeserializer('value'),
                equals(
                  '_\$FooBarEnumMap.entries.singleWhere((fooBarEnumMapEntry) => fooBarEnumMapEntry.value == value, orElse: () => throw ArgumentError(\'`\$value` is not one of the supported values: \${_\$FooBarEnumMap.values.join(\', \')}\')).key',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableEnumSerializerGenerator('FooBar')
                    .generateDeserializer('value'),
                equals(
                  'value != null ? _\$FooBarEnumMap.entries.singleWhere((fooBarEnumMapEntry) => fooBarEnumMapEntry.value == value, orElse: () => throw ArgumentError(\'`\$value` is not one of the supported values: \${_\$FooBarEnumMap.values.join(\', \')}\')).key : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
