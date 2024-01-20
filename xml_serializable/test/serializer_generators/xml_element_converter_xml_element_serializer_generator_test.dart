import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlElementConverterXmlElementSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                XmlElementConverterXmlElementSerializerGenerator(
                        'TestConverter')
                    .generateSerializer('value'),
                equals(
                  'value',
                ),
              );
            },
          );

          test(
            'should generate a null-aware serializer if constructed with a nullable type',
            () {
              expect(
                NullableXmlElementConverterXmlElementSerializerGenerator(
                        'TestConverter')
                    .generateSerializer('value'),
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
                XmlElementConverterXmlElementSerializerGenerator(
                        'TestConverter')
                    .generateDeserializer('value'),
                equals(
                  'const TestConverter().fromXmlElement(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableXmlElementConverterXmlElementSerializerGenerator(
                        'TestConverter')
                    .generateDeserializer('value'),
                equals(
                  'value != null ? const TestConverter().fromXmlElement(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
