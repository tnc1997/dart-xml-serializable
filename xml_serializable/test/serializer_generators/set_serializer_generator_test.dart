import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'SetSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                SetSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateSerializer('values'),
                equals(
                  'values',
                ),
              );

              expect(
                SetSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateSerializer('values'),
                equals(
                  'values.map((e) => e.toString())',
                ),
              );

              expect(
                SetSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateSerializer('values'),
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
                NullableSetSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateSerializer('values'),
                equals(
                  'values',
                ),
              );

              expect(
                NullableSetSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateSerializer('values'),
                equals(
                  'values?.map((e) => e.toString())',
                ),
              );

              expect(
                NullableSetSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateSerializer('values'),
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
                SetSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values.toSet()',
                ),
              );

              expect(
                SetSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values.map((e) => int.parse(e)).toSet()',
                ),
              );

              expect(
                SetSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values.map((e) => e != null ? int.parse(e) : null).toSet()',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableSetSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values?.toSet()',
                ),
              );

              expect(
                NullableSetSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values?.map((e) => int.parse(e)).toSet()',
                ),
              );

              expect(
                NullableSetSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values?.map((e) => e != null ? int.parse(e) : null).toSet()',
                ),
              );
            },
          );
        },
      );
    },
  );
}
