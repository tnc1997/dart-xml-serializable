import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'IterableConstructorGenerator',
    () {
      group(
        'generateConstructor',
        () {
          test(
            'should generate a constructor if constructed with a type',
            () {
              expect(
                IterableConstructorGenerator(
                  XmlTextConstructorGenerator(),
                ).generateConstructor('value'),
                equals(
                  'value.map((e) => XmlText(e))',
                ),
              );
            },
          );

          test(
            'should generate a null-aware constructor if constructed with a nullable type',
            () {
              expect(
                NullableIterableConstructorGenerator(
                  XmlTextConstructorGenerator(),
                ).generateConstructor('value'),
                equals(
                  'value?.map((e) => XmlText(e))',
                ),
              );
            },
          );
        },
      );
    },
  );
}
