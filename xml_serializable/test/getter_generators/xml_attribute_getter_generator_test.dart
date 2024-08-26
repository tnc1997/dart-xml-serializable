import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlAttributeGetterGenerator',
    () {
      group(
        'generateGetter',
        () {
          test(
            'should generate a getter with a name if constructed with a name',
            () {
              expect(
                XmlAttributeGetterGenerator('name').generateGetter('element'),
                equals(
                  'element.getAttribute(\'name\')!',
                ),
              );
            },
          );

          test(
            'should generate a getter with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlAttributeGetterGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateGetter('element'),
                equals(
                  'element.getAttribute(\'name\', namespace: \'https://www.example.com\')!',
                ),
              );
            },
          );

          test(
            'should generate a getter with an escaped name if constructed with a name that contains a reserved character',
            () {
              expect(
                XmlAttributeGetterGenerator('\$name').generateGetter('element'),
                equals(
                  'element.getAttribute(r\'\$name\')!',
                ),
              );
            },
          );

          test(
            'should generate a getter with an escaped name and namespace if constructed with a name and namespace that contain a reserved character',
            () {
              expect(
                XmlAttributeGetterGenerator(
                  '\$name',
                  namespace: '\$https://www.example.com',
                ).generateGetter('element'),
                equals(
                  'element.getAttribute(r\'\$name\', namespace: r\'\$https://www.example.com\')!',
                ),
              );
            },
          );

          test(
            'should generate a null-aware getter if constructed with a nullable type',
            () {
              expect(
                NullableXmlAttributeGetterGenerator('name')
                    .generateGetter('element'),
                equals(
                  'element.getAttribute(\'name\')',
                ),
              );
            },
          );
        },
      );
    },
  );
}
