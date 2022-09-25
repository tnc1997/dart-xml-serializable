import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'IterableSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                IterableSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateSerializer('values', {}),
                equals(
                  'values',
                ),
              );

              expect(
                IterableSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateSerializer('values', {}),
                equals(
                  'values.map((e) => e.toString())',
                ),
              );

              expect(
                IterableSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateSerializer('values', {}),
                equals(
                  'values.map((e) => e?.toString())',
                ),
              );
            },
          );

          test(
            'should generate a null-aware serializer if constructed with a nullable type',
            () {
              expect(
                NullableIterableSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateSerializer('values', {}),
                equals(
                  'values',
                ),
              );

              expect(
                NullableIterableSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateSerializer('values', {}),
                equals(
                  'values?.map((e) => e.toString())',
                ),
              );

              expect(
                NullableIterableSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateSerializer('values', {}),
                equals(
                  'values?.map((e) => e?.toString())',
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
                IterableSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateDeserializer('values', {}),
                equals(
                  'values',
                ),
              );

              expect(
                IterableSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateDeserializer('values', {}),
                equals(
                  'values.map((e) => int.parse(e))',
                ),
              );

              expect(
                IterableSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateDeserializer('values', {}),
                equals(
                  'values.map((e) => e != null ? int.parse(e) : null)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableIterableSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateDeserializer('values', {}),
                equals(
                  'values',
                ),
              );

              expect(
                NullableIterableSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateDeserializer('values', {}),
                equals(
                  'values?.map((e) => int.parse(e))',
                ),
              );

              expect(
                NullableIterableSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateDeserializer('values', {}),
                equals(
                  'values?.map((e) => e != null ? int.parse(e) : null)',
                ),
              );
            },
          );
        },
      );
    },
  );
}
