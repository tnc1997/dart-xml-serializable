import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlSerializableXmlElementSerializerGenerator',
    () {
      group(
        'generateSerializer',
        () {
          test(
            'should generate a serializer if constructed with a type',
            () {
              expect(
                XmlSerializableXmlElementSerializerGenerator('TestClass')
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
                NullableXmlSerializableXmlElementSerializerGenerator('TestClass')
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
                XmlSerializableXmlElementSerializerGenerator('TestClass')
                    .generateDeserializer('value'),
                equals(
                  'TestClass.fromXmlElement(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware deserializer if constructed with a nullable type',
            () {
              expect(
                NullableXmlSerializableXmlElementSerializerGenerator('TestClass')
                    .generateDeserializer('value'),
                equals(
                  'value != null ? TestClass.fromXmlElement(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
