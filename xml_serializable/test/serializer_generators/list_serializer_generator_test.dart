import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'ListSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                ListSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateSerializer('values'),
                equals(
                  'values',
                ),
              );

              expect(
                ListSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateSerializer('values'),
                equals(
                  'values.map((e) => e.toString())',
                ),
              );

              expect(
                ListSerializerGenerator(
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
                NullableListSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateSerializer('values'),
                equals(
                  'values',
                ),
              );

              expect(
                NullableListSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateSerializer('values'),
                equals(
                  'values?.map((e) => e.toString())',
                ),
              );

              expect(
                NullableListSerializerGenerator(
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
                ListSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values.toList()',
                ),
              );

              expect(
                ListSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values.map((e) => int.parse(e)).toList()',
                ),
              );

              expect(
                ListSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values.map((e) => e != null ? int.parse(e) : null).toList()',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableListSerializerGenerator(
                  DynamicSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values?.toList()',
                ),
              );

              expect(
                NullableListSerializerGenerator(
                  IntSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values?.map((e) => int.parse(e)).toList()',
                ),
              );

              expect(
                NullableListSerializerGenerator(
                  NullableIntSerializerGenerator(),
                ).generateDeserializer('values'),
                equals(
                  'values?.map((e) => e != null ? int.parse(e) : null).toList()',
                ),
              );
            },
          );
        },
      );
    },
  );
}
