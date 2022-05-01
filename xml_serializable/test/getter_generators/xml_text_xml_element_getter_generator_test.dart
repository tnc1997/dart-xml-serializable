import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group('XmlTextXmlElementGetterGenerator', () {
    group(
      'generateGetter',
      () {
        test(
          'should generate a getter with a name if constructed with a name',
          () {
            expect(
              XmlTextXmlElementGetterGenerator('name')
                  .generateGetter('element'),
              equals(
                'element.getElement(\'name\')!.getText()!',
              ),
            );
          },
        );

        test(
          'should generate a getter with a name and namespace if constructed with a name and namespace',
          () {
            expect(
              XmlTextXmlElementGetterGenerator(
                'name',
                namespace: 'https://www.example.com',
              ).generateGetter('element'),
              equals(
                'element.getElement(\'name\', namespace: \'https://www.example.com\')!.getText()!',
              ),
            );
          },
        );

        test(
          'should generate a null-aware getter if constructed with a nullable type',
          () {
            expect(
              NullableXmlTextXmlElementGetterGenerator('name')
                  .generateGetter('element'),
              equals(
                'element.getElement(\'name\')?.getText()',
              ),
            );
          },
        );
      },
    );
  });
}
