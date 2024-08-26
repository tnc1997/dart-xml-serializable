import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlSerializableXmlElementIterableGetterGenerator',
    () {
      group(
        'generateGetter',
        () {
          test(
            'should generate a getter with a name if constructed with a name',
            () {
              expect(
                XmlSerializableXmlElementIterableGetterGenerator('name')
                    .generateGetter('element'),
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
                XmlSerializableXmlElementIterableGetterGenerator(
                  'name',
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
                XmlSerializableXmlElementIterableGetterGenerator('\$name')
                    .generateGetter('element'),
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
                XmlSerializableXmlElementIterableGetterGenerator(
                  '\$name',
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
                NullableXmlSerializableXmlElementIterableGetterGenerator('name')
                    .generateGetter('element'),
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
