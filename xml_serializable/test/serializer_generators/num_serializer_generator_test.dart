import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'NumSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                NumSerializerGenerator().generateSerializer('value'),
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
                NullableNumSerializerGenerator().generateSerializer('value'),
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
                NumSerializerGenerator().generateDeserializer('value'),
                equals(
                  'num.parse(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableNumSerializerGenerator().generateDeserializer('value'),
                equals(
                  'value != null ? num.parse(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
