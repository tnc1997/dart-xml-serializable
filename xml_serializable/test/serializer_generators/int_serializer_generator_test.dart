import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'IntSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                IntSerializerGenerator().generateSerializer('value', {}),
                equals(
                  'value.toString()',
                ),
              );
            },
          );

          test(
            'should generate a null-aware serializer if constructed with a nullable type',
            () {
              expect(
                NullableIntSerializerGenerator()
                    .generateSerializer('value', {}),
                equals(
                  'value?.toString()',
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
                IntSerializerGenerator().generateDeserializer('value', {}),
                equals(
                  'int.parse(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableIntSerializerGenerator()
                    .generateDeserializer('value', {}),
                equals(
                  'value != null ? int.parse(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
