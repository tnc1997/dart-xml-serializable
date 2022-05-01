import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group('XmlTextGetterGenerator', () {
    group(
      'generateGetter',
      () {
        test(
          'should generate a getter if constructed with a type',
          () {
            expect(
              XmlTextGetterGenerator().generateGetter('element'),
              equals(
                'element.getText()!',
              ),
            );
          },
        );

        test(
          'should generate a null-aware getter if constructed with a nullable type',
          () {
            expect(
              NullableXmlTextGetterGenerator().generateGetter('element'),
              equals(
                'element.getText()',
              ),
            );
          },
        );
      },
    );
  });
}
