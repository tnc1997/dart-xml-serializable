import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'UriSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                UriSerializerGenerator().generateSerializer('value', {}),
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
                NullableUriSerializerGenerator()
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
                UriSerializerGenerator().generateDeserializer('value', {}),
                equals(
                  'Uri.parse(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableUriSerializerGenerator()
                    .generateDeserializer('value', {}),
                equals(
                  'value != null ? Uri.parse(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
