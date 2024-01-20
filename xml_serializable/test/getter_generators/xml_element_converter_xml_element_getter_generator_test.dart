import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group('XmlElementConverterXmlElementGetterGenerator', () {
    group(
      'generateGetter',
      () {
        test(
          'should generate a getter with a name if constructed with a name',
          () {
            expect(
              XmlElementConverterXmlElementGetterGenerator(
                'name',
                'TestConverter',
              ).generateGetter('element'),
              equals(
                'element.getElement(\'name\')!',
              ),
            );
          },
        );

        test(
          'should generate a getter with a name and namespace if constructed with a name and namespace',
          () {
            expect(
              XmlElementConverterXmlElementGetterGenerator(
                'name',
                'TestConverter',
                namespace: 'https://www.example.com',
              ).generateGetter('element'),
              equals(
                'element.getElement(\'name\', namespace: \'https://www.example.com\')!',
              ),
            );
          },
        );

        test(
          'should generate a null-aware getter if constructed with a nullable type',
          () {
            expect(
              NullableXmlElementConverterXmlElementGetterGenerator(
                'name',
                'TestConverter',
              ).generateGetter('element'),
              equals(
                'element.getElement(\'name\')',
              ),
            );
          },
        );
      },
    );
  });
}
