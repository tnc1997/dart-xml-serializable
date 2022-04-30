import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlSerializableXmlElementConstructorGenerator',
    () {
      group(
        'generateConstructor',
        () {
          test(
            'should generate a constructor with a name if constructed with a name',
            () {
              expect(
                XmlSerializableXmlElementConstructorGenerator('name')
                    .generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), value.toXmlAttributes(namespaces: namespaces), value.toXmlChildren(namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a constructor with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlSerializableXmlElementConstructorGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\', namespaces[\'https://www.example.com\']), value.toXmlAttributes(namespaces: namespaces), value.toXmlChildren(namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a constructor with a name and is self closing if constructed with a name and is self closing',
            () {
              expect(
                XmlSerializableXmlElementConstructorGenerator(
                  'name',
                  isSelfClosing: true,
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), value.toXmlAttributes(namespaces: namespaces), value.toXmlChildren(namespaces: namespaces), true)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type',
            () {
              expect(
                NullableXmlSerializableXmlElementConstructorGenerator(
                  'name',
                  includeIfNull: false,
                ).generateConstructor('value'),
                equals(
                  'value != null ? XmlElement(XmlName(\'name\'), value.toXmlAttributes(namespaces: namespaces), value.toXmlChildren(namespaces: namespaces)) : null',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type and include if null',
            () {
              expect(
                NullableXmlSerializableXmlElementConstructorGenerator(
                  'name',
                  includeIfNull: true,
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), value?.toXmlAttributes(namespaces: namespaces) ?? [], value?.toXmlChildren(namespaces: namespaces) ?? [])',
                ),
              );
            },
          );
        },
      );
    },
  );
}
