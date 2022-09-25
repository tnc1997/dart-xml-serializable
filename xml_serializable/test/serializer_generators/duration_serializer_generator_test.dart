import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'DurationSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                DurationSerializerGenerator().generateSerializer('value', {}),
                equals(
                  'value.inMicroseconds.toString()',
                ),
              );
            },
          );

          test(
            'should generate a null-aware serializer if constructed with a nullable type',
            () {
              expect(
                NullableDurationSerializerGenerator()
                    .generateSerializer('value', {}),
                equals(
                  'value?.inMicroseconds.toString()',
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
                DurationSerializerGenerator().generateDeserializer('value', {}),
                equals(
                  'Duration(microseconds: int.parse(value))',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableDurationSerializerGenerator()
                    .generateDeserializer('value', {}),
                equals(
                  'value != null ? Duration(microseconds: int.parse(value)) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
