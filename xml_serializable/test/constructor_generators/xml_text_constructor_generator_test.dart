import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlTextConstructorGenerator',
    () {
      group(
        'generateConstructor',
        () {
          test(
            'should generate a constructor if constructed with a type',
            () {
              expect(
                XmlTextConstructorGenerator().generateConstructor('value'),
                equals(
                  'XmlText(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type',
            () {
              expect(
                NullableXmlTextConstructorGenerator()
                    .generateConstructor('value'),
                equals(
                  'value != null ? XmlText(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
