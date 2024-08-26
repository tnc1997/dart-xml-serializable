import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlAttributeConstructorGenerator',
    () {
      group(
        'generateConstructor',
        () {
          test(
            'should generate a constructor with a name if constructed with a name',
            () {
              expect(
                XmlAttributeConstructorGenerator('name')
                    .generateConstructor('value'),
                equals(
                  'XmlAttribute(XmlName(\'name\'), value)',
                ),
              );
            },
          );

          test(
            'should generate a constructor with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlAttributeConstructorGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateConstructor('value'),
                equals(
                  'XmlAttribute(XmlName(\'name\', namespaces[\'https://www.example.com\']), value)',
                ),
              );
            },
          );

          test(
            'should generate a constructor with an escaped name if constructed with a name that contains a reserved character',
            () {
              expect(
                XmlAttributeConstructorGenerator('\$name')
                    .generateConstructor('value'),
                equals(
                  'XmlAttribute(XmlName(r\'\$name\'), value)',
                ),
              );
            },
          );

          test(
            'should generate a constructor with an escaped name and namespace if constructed with a name and namespace that contain a reserved character',
            () {
              expect(
                XmlAttributeConstructorGenerator(
                  '\$name',
                  namespace: '\$https://www.example.com',
                ).generateConstructor('value'),
                equals(
                  'XmlAttribute(XmlName(r\'\$name\', namespaces[r\'\$https://www.example.com\']), value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type',
            () {
              expect(
                NullableXmlAttributeConstructorGenerator('name')
                    .generateConstructor('value'),
                equals(
                  'value != null ? XmlAttribute(XmlName(\'name\'), value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
