import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'StringSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                StringSerializerGenerator().generateSerializer('value'),
                equals(
                  'value',
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
                StringSerializerGenerator().generateDeserializer('value'),
                equals(
                  'value',
                ),
              );
            },
          );
        },
      );
    },
  );
}
