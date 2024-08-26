import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlRootElementConstructorGenerator',
    () {
      group(
        'generateConstructor',
        () {
          test(
            'should generate a constructor with a name if constructed with a name',
            () {
              expect(
                XmlRootElementConstructorGenerator('name')
                    .generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), [...namespaces.toXmlAttributes(), ...value.toXmlAttributes(namespaces: namespaces)], value.toXmlChildren(namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a constructor with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlRootElementConstructorGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\', namespaces[\'https://www.example.com\']), [...namespaces.toXmlAttributes(), ...value.toXmlAttributes(namespaces: namespaces)], value.toXmlChildren(namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a constructor with a name and is self closing if constructed with a name and is self closing',
            () {
              expect(
                XmlRootElementConstructorGenerator(
                  'name',
                  isSelfClosing: true,
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), [...namespaces.toXmlAttributes(), ...value.toXmlAttributes(namespaces: namespaces)], value.toXmlChildren(namespaces: namespaces), true)',
                ),
              );
            },
          );

          test(
            'should generate a constructor with an escaped name if constructed with a name that contains a reserved character',
            () {
              expect(
                XmlRootElementConstructorGenerator('\$name')
                    .generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(r\'\$name\'), [...namespaces.toXmlAttributes(), ...value.toXmlAttributes(namespaces: namespaces)], value.toXmlChildren(namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a constructor with an escaped name and namespace if constructed with a name and namespace that contain a reserved character',
            () {
              expect(
                XmlRootElementConstructorGenerator(
                  '\$name',
                  namespace: '\$https://www.example.com',
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(r\'\$name\', namespaces[r\'\$https://www.example.com\']), [...namespaces.toXmlAttributes(), ...value.toXmlAttributes(namespaces: namespaces)], value.toXmlChildren(namespaces: namespaces))',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type',
            () {
              expect(
                NullableXmlRootElementConstructorGenerator('name')
                    .generateConstructor('value'),
                equals(
                  'value != null ? XmlElement(XmlName(\'name\'), [...namespaces.toXmlAttributes(), ...value.toXmlAttributes(namespaces: namespaces)], value.toXmlChildren(namespaces: namespaces)) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
