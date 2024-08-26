import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlConverterXmlElementIterableGetterGenerator',
    () {
      group(
        'generateGetter',
        () {
          test(
            'should generate a getter with a name if constructed with a name',
            () {
              expect(
                XmlConverterXmlElementIterableGetterGenerator(
                  'name',
                  'TestConverter',
                ).generateGetter('element'),
                equals(
                  'element.getElements(\'name\')!',
                ),
              );
            },
          );

          test(
            'should generate a getter with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlConverterXmlElementIterableGetterGenerator(
                  'name',
                  'TestConverter',
                  namespace: 'https://www.example.com',
                ).generateGetter('element'),
                equals(
                  'element.getElements(\'name\', namespace: \'https://www.example.com\')!',
                ),
              );
            },
          );

          test(
            'should generate a getter with an escaped name if constructed with a name that contains a reserved character',
            () {
              expect(
                XmlConverterXmlElementIterableGetterGenerator(
                  '\$name',
                  'TestConverter',
                ).generateGetter('element'),
                equals(
                  'element.getElements(r\'\$name\')!',
                ),
              );
            },
          );

          test(
            'should generate a getter with an escaped name and namespace if constructed with a name and namespace that contain a reserved character',
            () {
              expect(
                XmlConverterXmlElementIterableGetterGenerator(
                  '\$name',
                  'TestConverter',
                  namespace: '\$https://www.example.com',
                ).generateGetter('element'),
                equals(
                  'element.getElements(r\'\$name\', namespace: r\'\$https://www.example.com\')!',
                ),
              );
            },
          );

          test(
            'should generate a null-aware getter if constructed with a nullable type',
            () {
              expect(
                NullableXmlConverterXmlElementIterableGetterGenerator(
                  'name',
                  'TestConverter',
                ).generateGetter('element'),
                equals(
                  'element.getElements(\'name\')',
                ),
              );
            },
          );
        },
      );
    },
  );
}
