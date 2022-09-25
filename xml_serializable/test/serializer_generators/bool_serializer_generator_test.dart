import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'BoolSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                BoolSerializerGenerator().generateSerializer('value', {}),
                equals(
                  'value == true ? \'true\' : \'false\'',
                ),
              );
            },
          );

          test(
            'should generate a null-aware serializer if constructed with a nullable type',
            () {
              expect(
                NullableBoolSerializerGenerator()
                    .generateSerializer('value', {}),
                equals(
                  'value != null ? value == true ? \'true\' : \'false\' : null',
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
                BoolSerializerGenerator().generateDeserializer('value', {}),
                equals(
                  'value == \'true\' || value == \'1\' ? true : value == \'false\' || value == \'0\' ? false : throw FormatException(\'Invalid bool format\', value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableBoolSerializerGenerator()
                    .generateDeserializer('value', {}),
                equals(
                  'value != null ? value == \'true\' || value == \'1\' ? true : value == \'false\' || value == \'0\' ? false : throw FormatException(\'Invalid bool format\', value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
