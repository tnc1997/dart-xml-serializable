import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlCDATAGetterGenerator',
    () {
      group(
        'generateGetter',
        () {
          test(
            'should generate a getter if constructed with a type',
            () {
              expect(
                XmlCDATAGetterGenerator().generateGetter('element'),
                equals(
                  'element.getCDATA()!',
                ),
              );
            },
          );

          test(
            'should generate a null-aware getter if constructed with a nullable type',
            () {
              expect(
                NullableXmlCDATAGetterGenerator().generateGetter('element'),
                equals(
                  'element.getCDATA()',
                ),
              );
            },
          );
        },
      );
    },
  );
}
