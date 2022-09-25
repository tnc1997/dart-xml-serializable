import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'DoubleSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                DoubleSerializerGenerator().generateSerializer('value', {}),
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
                NullableDoubleSerializerGenerator()
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
                DoubleSerializerGenerator().generateDeserializer('value', {}),
                equals(
                  'double.parse(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableDoubleSerializerGenerator()
                    .generateDeserializer('value', {}),
                equals(
                  'value != null ? double.parse(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
