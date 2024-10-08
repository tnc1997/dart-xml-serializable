import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlConverterXmlElementSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                XmlConverterXmlElementSerializerGenerator('TestConverter')
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
                XmlConverterXmlElementSerializerGenerator(
                  'TestConverter',
                  isNullable: true,
                ).generateSerializer('value'),
                equals(
                  'value',
                ),
              );
            },
          );

          test(
            'should generate a null-aware serializer if constructed with a nullable type and a nullable converter type',
            () {
              expect(
                XmlConverterXmlElementSerializerGenerator(
                  'TestConverter',
                  isNullable: true,
                  isConverterNullable: true,
                ).generateSerializer('value'),
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
                XmlConverterXmlElementSerializerGenerator('TestConverter')
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
                XmlConverterXmlElementSerializerGenerator(
                  'TestConverter',
                  isNullable: true,
                ).generateDeserializer('value'),
                equals(
                  'value != null ? const TestConverter().fromXmlElement(value) : null',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type and a nullable converter type',
            () {
              expect(
                XmlConverterXmlElementSerializerGenerator(
                  'TestConverter',
                  isNullable: true,
                  isConverterNullable: true,
                ).generateDeserializer('value'),
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
