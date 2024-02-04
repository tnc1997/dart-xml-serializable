import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlTextXmlElementIterableGetterGenerator',
    () {
      group(
        'generateGetter',
        () {
          test(
            'should generate a getter with a name if constructed with a name',
            () {
              expect(
                XmlTextXmlElementIterableGetterGenerator('name')
                    .generateGetter('element'),
                equals(
                  'element.getElements(\'name\')!.map((e) => e.getText()).whereType<String>()',
                ),
              );
            },
          );

          test(
            'should generate a getter with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlTextXmlElementIterableGetterGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateGetter('element'),
                equals(
                  'element.getElements(\'name\', namespace: \'https://www.example.com\')!.map((e) => e.getText()).whereType<String>()',
                ),
              );
            },
          );

          test(
            'should generate a null-aware getter if constructed with a nullable type',
            () {
              expect(
                NullableXmlTextXmlElementIterableGetterGenerator('name')
                    .generateGetter('element'),
                equals(
                  'element.getElements(\'name\')?.map((e) => e.getText()).whereType<String>()',
                ),
              );
            },
          );
        },
      );
    },
  );
}
