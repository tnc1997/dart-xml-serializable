import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlConverterSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                XmlConverterSerializerGenerator('TestConverter')
                    .generateSerializer('value'),
                equals(
                  'const TestConverter().toXml(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware serializer if constructed with a nullable type',
            () {
              expect(
                NullableXmlConverterSerializerGenerator('TestConverter')
                    .generateSerializer('value'),
                equals(
                  'value != null ? const TestConverter().toXml(value) : null',
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
                XmlConverterSerializerGenerator('TestConverter')
                    .generateDeserializer('value'),
                equals(
                  'const TestConverter().fromXml(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableXmlConverterSerializerGenerator('TestConverter')
                    .generateDeserializer('value'),
                equals(
                  'value != null ? const TestConverter().fromXml(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
