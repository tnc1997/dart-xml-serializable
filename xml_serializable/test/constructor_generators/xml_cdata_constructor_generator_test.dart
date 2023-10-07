import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlCDATAConstructorGenerator',
    () {
      group(
        'generateConstructor',
        () {
          test(
            'should generate a constructor if constructed with a type',
            () {
              expect(
                XmlCDATAConstructorGenerator().generateConstructor('value'),
                equals(
                  'XmlCDATA(value)',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type',
            () {
              expect(
                NullableXmlCDATAConstructorGenerator()
                    .generateConstructor('value'),
                equals(
                  'value != null ? XmlCDATA(value) : null',
                ),
              );
            },
          );
        },
      );
    },
  );
}
