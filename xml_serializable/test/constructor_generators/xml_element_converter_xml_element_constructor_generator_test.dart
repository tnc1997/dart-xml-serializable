import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlElementConverterXmlElementConstructorGenerator',
    () {
      group(
        'generateConstructor',
        () {
          test(
            'should generate a constructor with a name if constructed with a name',
            () {
              expect(
                XmlElementConverterXmlElementConstructorGenerator(
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
                XmlElementConverterXmlElementConstructorGenerator(
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
                XmlElementConverterXmlElementConstructorGenerator(
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
            'should generate a null-aware constructor if constructed with a nullable type',
            () {
              expect(
                NullableXmlElementConverterXmlElementConstructorGenerator(
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
                NullableXmlElementConverterXmlElementConstructorGenerator(
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
