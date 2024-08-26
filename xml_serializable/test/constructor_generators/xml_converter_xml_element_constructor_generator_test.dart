import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlConverterXmlElementConstructorGenerator',
    () {
      group(
        'generateConstructor',
        () {
          test(
            'should generate a constructor with a name if constructed with a name',
            () {
              expect(
                XmlConverterXmlElementConstructorGenerator(
                  'name',
                  'TestConverter',
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), const TestConverter().toXmlAttributes(value, namespaces: namespaces), const TestConverter().toXmlChildren(value, namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a constructor with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlConverterXmlElementConstructorGenerator(
                  'name',
                  'TestConverter',
                  namespace: 'https://www.example.com',
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\', namespaces[\'https://www.example.com\']), const TestConverter().toXmlAttributes(value, namespaces: namespaces), const TestConverter().toXmlChildren(value, namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a constructor with a name and is self closing if constructed with a name and is self closing',
            () {
              expect(
                XmlConverterXmlElementConstructorGenerator(
                  'name',
                  'TestConverter',
                  isSelfClosing: true,
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), const TestConverter().toXmlAttributes(value, namespaces: namespaces), const TestConverter().toXmlChildren(value, namespaces: namespaces), true)',
                ),
              );
            },
          );

          test(
            'should generate a constructor with an escaped name if constructed with a name that contains a reserved character',
            () {
              expect(
                XmlConverterXmlElementConstructorGenerator(
                  '\$name',
                  'TestConverter',
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(r\'\$name\'), const TestConverter().toXmlAttributes(value, namespaces: namespaces), const TestConverter().toXmlChildren(value, namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a constructor with an escaped name and namespace if constructed with a name and namespace that contain a reserved character',
            () {
              expect(
                XmlConverterXmlElementConstructorGenerator(
                  '\$name',
                  'TestConverter',
                  namespace: '\$https://www.example.com',
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(r\'\$name\', namespaces[r\'\$https://www.example.com\']), const TestConverter().toXmlAttributes(value, namespaces: namespaces), const TestConverter().toXmlChildren(value, namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type',
            () {
              expect(
                NullableXmlConverterXmlElementConstructorGenerator(
                  'name',
                  'TestConverter',
                  includeIfNull: false,
                ).generateConstructor('value'),
                equals(
                  'value != null ? XmlElement(XmlName(\'name\'), const TestConverter().toXmlAttributes(value, namespaces: namespaces), const TestConverter().toXmlChildren(value, namespaces: namespaces)) : null',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type and include if null',
            () {
              expect(
                NullableXmlConverterXmlElementConstructorGenerator(
                  'name',
                  'TestConverter',
                  includeIfNull: true,
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), value != null ? const TestConverter().toXmlAttributes(value, namespaces: namespaces) : [], value != null ? const TestConverter().toXmlChildren(value, namespaces: namespaces) : [])',
                ),
              );
            },
          );
        },
      );
    },
  );
}
