import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'DateTimeSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                DateTimeSerializerGenerator().generateSerializer('value'),
                equals(
                  'value.toIso8601String()',
                ),
              );
            },
          );

          test(
            'should generate a null-aware serializer if constructed with a nullable type',
            () {
              expect(
                NullableDateTimeSerializerGenerator()
                    .generateSerializer('value'),
                equals(
                  'value?.toIso8601String()',
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
                DateTimeSerializerGenerator().generateDeserializer('value'),
                equals(
                  'DateTime.parse(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableDateTimeSerializerGenerator()
                    .generateDeserializer('value'),
                equals(
                  'value != null ? DateTime.parse(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
