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
                XmlTextXmlElementConstructorGenerator('name')
                    .generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), [], [XmlText(value)])',
                ),
              );
            },
          );

          test(
            'should generate a constructor with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlTextXmlElementConstructorGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\', namespaces[\'https://www.example.com\']), [], [XmlText(value)])',
                ),
              );
            },
          );

          test(
            'should generate a constructor with a name and is self closing if constructed with a name and is self closing',
            () {
              expect(
                XmlTextXmlElementConstructorGenerator(
                  'name',
                  isSelfClosing: true,
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), [], [XmlText(value)], true)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type',
            () {
              expect(
                NullableXmlTextXmlElementConstructorGenerator(
                  'name',
                  includeIfNull: false,
                ).generateConstructor('value'),
                equals(
                  'value != null ? XmlElement(XmlName(\'name\'), [], [XmlText(value)]) : null',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type and include if null',
            () {
              expect(
                NullableXmlTextXmlElementConstructorGenerator(
                  'name',
                  includeIfNull: true,
                ).generateConstructor('value'),
                equals(
                  'XmlElement(XmlName(\'name\'), [], value != null ? [XmlText(value)] : [])',
                ),
              );
            },
          );
        },
      );
    },
  );
}
